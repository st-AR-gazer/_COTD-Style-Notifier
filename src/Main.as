CTrackMania@ g_app;

CTrackManiaNetwork@ g_network;
CTrackManiaNetworkServerInfo@ g_serverInfo;
CGameCtnChallenge@ g_map;
CGameCtnChallengeInfo@ g_mapInfo;

const bool RETURN_ONLY = false;
void Main() {
    log(" " + GetTimeF(), LogLevel::Test, 12);
    if (RETURN_ONLY) return;

    log("Main func has started", LogLevel::Info, 6);
    
    NadeoServices::AddAudience("NadeoClubServices");
    while (!NadeoServices::IsAuthenticated("NadeoClubServices")) { yield(); }

    if (!Perms()) return;
    if (!IsCurrentlyInCOTD()) return;
    
    MapDataPopulateDefault();

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