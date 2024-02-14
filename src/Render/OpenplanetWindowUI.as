void RenderWindowedUI() {

    UI::SetNextWindowPos(200, 200, false ? UI::Cond::Always : UI::Cond::FirstUseEver);

    int window_flags = UI::WindowFlags::NoTitleBar | UI::WindowFlags::NoCollapse | 
                       UI::WindowFlags::AlwaysAutoResize | UI::WindowFlags::NoDocking;

    if (!UI::IsOverlayShown()) window_flags |= UI::WindowFlags::NoInputs;
    UI::Begin("COTD Style Notifyer - Test Window", window_flags);
        UI::BeginGroup();
            UI::Text("UID: " + g_mapInfo.MapUid);
            UI::Text("NIK: " + g_mapInfo.AuthorNickName);
            UI::Text("COM: " + g_mapInfo.Comments);
            UI::Separator();
            if (UI::Button("Send Request", vec2(100, 0))) { StartServerComms(); }

        UI::EndGroup();
    UI::End();
}