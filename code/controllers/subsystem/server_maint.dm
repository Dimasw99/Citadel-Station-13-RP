#define PING_BUFFER_TIME 25

SUBSYSTEM_DEF(server_maint)
	name = "Server Tasks"
	wait = 6
	subsystem_flags = SS_POST_FIRE_TIMING
	priority = FIRE_PRIORITY_SERVER_MAINT
	init_order = INIT_ORDER_SERVER_MAINT
	init_stage = INIT_STAGE_EARLY
	runlevels = RUNLEVEL_LOBBY | RUNLEVELS_DEFAULT
	var/list/currentrun
	///Associated list of list names to lists to clear of nulls
	var/list/lists_to_clear
	///Delay between list clearings in ticks
	var/delay = 5
	var/cleanup_ticker = 0

/datum/controller/subsystem/server_maint/Initialize()
	if (fexists("tmp/"))
		fdel("tmp/")

	if (!!CONFIG_GET(flag/hub) != !!GLOB.hub_visibility)
		world.update_hub_visibility(CONFIG_GET(flag/hub))

	//Keep in mind, because of how delay works adding a list here makes each list take wait * delay more time to clear
	//Do it for stuff that's properly important, and shouldn't have null checks inside its other uses
	lists_to_clear = list(
		"player_list" = GLOB.player_list,
		"mob_list" = GLOB.mob_list,
		"living_mob_list" = living_mob_list,
		"dead_mob_list" = dead_mob_list
	)

	return SS_INIT_SUCCESS

/datum/controller/subsystem/server_maint/fire(resumed = FALSE)
	if(!resumed)
		if(listclearnulls(GLOB.clients))
			log_world("Found a null in clients list!")
		src.currentrun = GLOB.clients.Copy()

		var/position_in_loop = (cleanup_ticker / delay) + 1	 //Index at 1, thanks byond

		if(!(position_in_loop % 1)) //If it's a whole number
			var/listname = lists_to_clear[position_in_loop]
			if(listclearnulls(lists_to_clear[listname]))
				log_world("Found a null in [listname]!")

		cleanup_ticker++

		var/amount_to_work = length(lists_to_clear)
		if(cleanup_ticker >= amount_to_work * delay) //If we've already done a loop, reset
			cleanup_ticker = 0

	var/list/currentrun = src.currentrun
	var/round_started = SSticker.HasRoundStarted()
	var/kick_inactive = !!config_legacy.kick_inactive
	var/afk_period
	if(kick_inactive)
		afk_period = (config_legacy.kick_inactive MINUTES)

	for(var/I in currentrun)
		var/client/C = I

		//handle kicking inactive players
		if(round_started && kick_inactive && !C.holder && C.is_afk(afk_period))
			var/cmob = C.mob
			if (!isnewplayer(cmob))
				log_access("AFK: [key_name(C)]")
				to_chat(C, SPAN_USERDANGER("You have been inactive for more than [DisplayTimeText(afk_period)] and have been disconnected.</span><br><span class='danger'>You may reconnect via the button in the file menu or by <b><u><a href='byond://winset?command=.reconnect'>clicking here to reconnect</a></u></b>."))
				QDEL_IN(C, 1) //to ensure they get our message before getting disconnected
				continue

		if (!(!C || world.time - C.connection_time < PING_BUFFER_TIME || C.inactivity >= (wait-1)))
			winset(C, null, "command=.update_ping+[num2text(world.time+world.tick_lag*TICK_USAGE_REAL/100, 32)]")

		if (MC_TICK_CHECK) //one day, when ss13 has 1000 people per server, you guys are gonna be glad I added this tick check
			return

/datum/controller/subsystem/server_maint/Shutdown()
	if (fexists("tmp/"))
		fdel("tmp/")

	for(var/thing in GLOB.clients)
		if(!thing)
			continue
		var/client/C = thing
		C?.tgui_panel?.send_roundrestart()

/datum/controller/subsystem/server_maint/proc/UpdateHubStatus()
	return // disabled.

#undef PING_BUFFER_TIME

// todo: SShub_manager
/datum/controller/subsystem/server_maint/proc/queue_hub_update()
	addtimer(CALLBACK(src, PROC_REF(UpdateHubStatus)), 0)
