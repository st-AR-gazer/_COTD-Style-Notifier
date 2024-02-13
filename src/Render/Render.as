[Setting category="Size and Position" name="Custom Width"]
bool UseOpenplanetWindow;

void Render() {
    if (!IsCurrentlyInCOTD() && !Perms()) return;

    if (UseOpenplanetWindow) { RenderWindowedUI(); } else { RenderOverlayUI(); }
}