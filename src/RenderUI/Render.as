void RenderUI() {

    UI::SetNextWindowPos(200, 200, false ? UI::Cond::Always : UI::Cond::FirstUseEver);

    int window_flags = UI::WindowFlags::NoTitleBar | UI::WindowFlags::NoCollapse | UI::WindowFlags::AlwaysAutoResize | UI::WindowFlags::NoDocking;

    if (!UI::IsOverlayShown()) window_flags |= UI::WindowFlags::NoInputs;
    UI::Begin("COTD Style Notifyer - Test Window", window_flags);
        UI::BeginGroup();
            UI::Text("Map UID here");
            UI::Text("Author nickname here");
            UI::Text("Map comment here");
            UI::Separator();
            if (UI::Button("Send Request", vec2(100, 0))) {
                StartSeverComms();
            }

        UI::EndGroup();
    UI::End();
}

void Render() {
    if (!IsCurrentlyInCOTD() && !Perms()) return;

    RenderUI();
}