CTrackMania@ g_app;
CTrackManiaNetwork@ g_network;
CTrackManiaNetworkServerInfo@ g_serverInfo;
CGameCtnChallenge@ g_map;
CGameCtnChallengeInfo@ g_mapInfo;




void Main() {
    log("Main func has started", LogLevel::Info, 6);
    NadeoServices::AddAudience("NadeoClubServices");
    while (!NadeoServices::IsAuthenticated("NadeoClubServices")) {
      yield();
    }
    if (!Perms()) return;
    if (!IsCurrentlyInCOTD()) return;
    
    Set20HourFlag();

    MapDataPopulate();

    StartSeverComms();

}

void Update(float dt) {
    CTrackMania@ app = cast<CTrackMania>(GetApp());
    if (app is null) return;
    @g_app = app;

    auto network = cast<CTrackManiaNetwork>(app.Network);
    if (network is null) return;
    @g_network = network;
    
    auto serverInfo = cast<CTrackManiaNetworkServerInfo>(network.ServerInfo);
    if (serverInfo is null) return;
    @g_serverInfo = serverInfo;
    
    auto map = cast<CGameCtnChallenge>(app.RootMap);
    if (map is null) return;
    @g_map = map;

    auto mapInfo = cast<CGameCtnChallengeInfo>(app.RootMap.MapInfo);
    if (mapInfo is null) return;
    @g_mapInfo = mapInfo;
}