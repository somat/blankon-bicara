using Gtk;

public class FullWindow : Window {
    
    public FullWindow() {
        this.fullscreen();
        this.destroy.connect(Gtk.main_quit);
        var box = new EventBox();
        add(box);
        Signal.connect(this, "button-press-event", (GLib.Callback) window_clicked, box );
    }
    
    public int window_clicked(Gdk.EventButton *ev) {
        double x = ev.x_root;
        double y = ev.y_root;
        stdout.printf("Clicked! X : %f - Y: %f \n", x, y);
        return 0;
    }
    
}

public int main(string[] args) {
    Gtk.init(ref args);
    var window = new FullWindow();
    window.show_all();
    
    Gtk.main();
    return 0;
}
