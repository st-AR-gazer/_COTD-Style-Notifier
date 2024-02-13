void Render() {
    if (!IsCurrentlyInCOTD() && !Perms()) return;

    if (UseOpenplanetWindow) { RenderWindowedUI(); } else { RenderOverlayUI(); }
}