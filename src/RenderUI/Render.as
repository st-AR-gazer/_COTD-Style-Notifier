void RenderUI() {

    UI::SetNextWindowPos(200, 200, false ? UI::Cond::Always : UI::Cond::FirstUseEver);

    int window_flags = UI::WindowFlags::NoTitleBar | UI::WindowFlags::NoCollapse | UI::WindowFlags::AlwaysAutoResize | UI::WindowFlags::NoDocking;

    if (!UI::IsOverlayShown()) window_flags |= UI::WindowFlags::NoInputs;
    UI::Begin("COTD Style Notifyer - Test Window", window_flags);
        UI::BeginGroup();
            UI::Text(g_mapInfo.Name);
            UI::Text(g_mapInfo.AuthorNickName);
            UI::Text(g_mapInfo.Comments);
            UI::Separator();
            UI::Text("Map UID: " + map_info.MapUid);
            if (UI::Button("Send Request", vec2(100, 0))) {
                SendInfoToServer();
            }

        UI::EndGroup();
    UI::End();
}

void Render() {
    if (!IsCurrentlyInCOTD() && !Perms()) return;

    RenderUI();
}