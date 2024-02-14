CTrackMania@ g_app;

CTrackManiaNetwork@ g_network;
CTrackManiaNetworkServerInfo@ g_serverInfo;
CGameCtnChallenge@ g_map;
CGameCtnChallengeInfo@ g_mapInfo;

const bool RETURN_ONLY = false;
void Main() {
    log(" " + GetTimeF(), LogLevel::Test, 10);
    if (RETURN_ONLY) return;

    log("Main func has started", LogLevel::Info, 13);
    
    NadeoServices::AddAudience("NadeoClubServices");
    while (!NadeoServices::IsAuthenticated("NadeoClubServices")) { yield(); }

    if (!Perms()) return;
    if (!IsCurrentlyInCOTD()) return;

    log("Perms and COTD check passed", LogLevel::Info, 21);
    log("MapDataPopulateDefault() started", LogLevel::Info, 22);

    MapDataPopulateDefault();

    log("MapDataPopulateDefault() has been called, and the json has been populated with default data", LogLevel::Info, 26);
    log("StartSeverComms() started", LogLevel::Info, 27);

    StartSeverComms();
}

void Update(float dt) {
    if (!TimeRestriction()) return;
    if (!Perms()) return;
    if (!IsCurrentlyInCOTD()) return;

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