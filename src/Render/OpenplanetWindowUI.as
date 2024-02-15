void RenderWindowedUI() {
    if (g_mapInfo is null) return;

    UI::SetNextWindowPos(vec2(200, 200), false ? UI::Cond::Always : UI::Cond::FirstUseEver);

    int window_flags = UI::WindowFlags::NoTitleBar | UI::WindowFlags::NoCollapse | 
                       UI::WindowFlags::AlwaysAutoResize | UI::WindowFlags::NoDocking;

    if (!UI::IsOverlayShown()) window_flags |= UI::WindowFlags::NoInputs;
    UI::Begin("COTD Style Notifyer - Test Window", window_flags);
        UI::BeginGroup();
            UI::Text("UIDs: " + g_mapInfo.MapUid);
            UI::Text("NAME: " + g_mapInfo.Name);
            UI::Text("NICK: " + g_mapInfo.AuthorNickName);
            UI::Text("TYPE: " + g_mapInfo.MapType);
            UI::Text("STYL: " + g_mapInfo.MapStyle);
            UI::Text("TIME: " + GetTimeF());
            UI::Text("VERS: " + Meta::ExecutingPlugin());
            UI::Text("COMM: " + g_mapInfo.Comments);
            UI::Separator();
            if (UI::Button("Send Request", vec2(100, 0))) { StartServerComms(); }

        UI::EndGroup();
    UI::End();
}