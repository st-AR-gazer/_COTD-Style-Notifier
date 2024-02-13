CTrackMania@ g_app;

// CGameFid@ g_fids;

CTrackManiaNetwork@ g_network;
CTrackManiaNetworkServerInfo@ g_serverInfo;
CGameCtnChallenge@ g_map;
CGameCtnChallengeInfo@ g_mapInfo;

const bool RETURN_ONLY = true;
void Main() {
    log(" " + GetTimeFormatted(), LogLevel::Test, 12);
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
    TimeRestriction();
    if (!Perms()) return;
    if (!IsCurrentlyInCOTD()) return;

    CTrackMania@ app = cast<CTrackMania>(GetApp());
    if (app is null) return;
    @g_app = app;

	// // CGameFid@ fids = cast<CGameFid>(app. /*todo -- check variable declaration below.*/;
    // auto tmp = cast<CTrackMania>(app);
    // print("CTrackMania.ManiaTitlesFolder: " + tostring(tmp.ManiaTitlesFolder));
    // print("CTrackMania.LoadedManiaTitle: " + tostring(tmp.LoadedManiaTitle.fid));
    // print("CTrackMania.LoadedCore: " + tostring(tmp.LoadedCore));
    // print("CTrackMania.Resources: " + tostring(tmp.Resources));
    // print("CTrackMania.RootMap: " + tostring(tmp.RootMap.MapInfo.Fids.Trees));

    // 
    // if (fids is null) return;
    // @g_fids = fids;

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