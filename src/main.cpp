#include <wx/wx.h>
#include "SpinFrame.h"

#ifdef HAVE_XRC
#include "SpinFrameXRC.h"
#include <wx/xrc/xmlres.h>
#endif

class SpinApp : public wxApp
{
public:
    virtual bool OnInit();
    virtual int OnExit();

private:
    void InitializeXRC();
};

wxIMPLEMENT_APP(SpinApp);

bool SpinApp::OnInit()
{
    // Inicializar XRC se disponível
#ifdef HAVE_XRC
    InitializeXRC();
#endif

    // Criar frame principal
#ifdef HAVE_XRC
    // Verificar se deve usar XRC (pode ser uma opção de linha de comando)
    bool useXRC = false;

    for (int i = 1; i < argc; i++) {
        if (wxString(argv[i]) == "--xrc") {
            useXRC = true;
            break;
        }
    }

    SpinFrameBase* frame;
    if (useXRC) {
        frame = new SpinFrameXRC();
    } else {
        frame = new SpinFrame();
    }
#else
    SpinFrame* frame = new SpinFrame();
#endif

    frame->Show(true);
    return true;
}

int SpinApp::OnExit()
{
#ifdef HAVE_XRC
    wxXmlResource::Get()->ClearHandlers();
#endif
    return wxApp::OnExit();
}

#ifdef HAVE_XRC
void SpinApp::InitializeXRC()
{
    wxXmlResource::Get()->InitAllHandlers();

    // Tentar carregar arquivo XRC
    wxString xrcFile = "spinapp.xrc";

    // Procurar em vários locais
    wxArrayString searchPaths;
    searchPaths.Add(".");
    searchPaths.Add("../data");
    searchPaths.Add("/usr/local/share/spinapp");
    searchPaths.Add("/usr/share/spinapp");

    bool xrcLoaded = false;
    for (size_t i = 0; i < searchPaths.GetCount(); i++) {
        wxString fullPath = searchPaths[i] + "/" + xrcFile;
        if (wxFileExists(fullPath)) {
            if (wxXmlResource::Get()->Load(fullPath)) {
                xrcLoaded = true;
                break;
            }
        }
    }

    if (!xrcLoaded) {
        wxLogWarning("Arquivo XRC não encontrado. Usando interface padrão.");
    }
}
#endif