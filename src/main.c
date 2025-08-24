#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <gtk/gtk.h>
#include <stdio.h>

static void on_button_clicked(GtkWidget *widget, gpointer data) {
  g_print("Botão clicado!\n");
}

int main(int argc, char *argv[]) {
  GtkWidget *window;
  GtkWidget *button;

  // Inicializa o GTK
  gtk_init(&argc, &argv);

  // Cria uma nova janela
  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title(GTK_WINDOW(window), "Exemplo GTK");
  gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);
  gtk_container_set_border_width(GTK_CONTAINER(window), 10);

  // Conecta o evento de fechar a janela
  g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL);

  // Cria um botão e conecta o sinal de clique
  button = gtk_button_new_with_label("Clique aqui");
  g_signal_connect(button, "clicked", G_CALLBACK(on_button_clicked), NULL);

  // Adiciona o botão à janela
  gtk_container_add(GTK_CONTAINER(window), button);

  // Exibe tudo
  gtk_widget_show_all(window);

  // Entra no loop principal do GTK
  gtk_main();

  return 0;
}
