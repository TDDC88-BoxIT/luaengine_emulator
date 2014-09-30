#include "emulatorwindow.h"
#include "ui_emulatorwindow.h"
extern "C" {
# include "lua/include/lua.h"
# include "lua/include/lauxlib.h"
# include "lua/include/lualib.h"
}

EmulatorWindow::EmulatorWindow(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::EmulatorWindow)
{
    ui->setupUi(this);

    scene = new QGraphicsScene(this);
    ui->graphicsView->setScene(scene);

    QBrush redBrush(Qt::red);
    QBrush blueBrush(Qt::blue);
    QPen blackPen(Qt::black);
    blackPen.setWidth(6);

    ellipse = scene->addEllipse(10,10,100,100,blackPen,redBrush);
    rectangle = scene->addRect(-100,-100,50,50,blackPen,blueBrush);
    rectangle->setFlag(QGraphicsItem::ItemIsMovable);

    ui->textBrowser->setText("Hello world");

    //StbEmulator se(scene);

    lua_State* L = luaL_newstate();
    luaL_openlibs(L);

    //lua_pushcfunction(L, l_surface_clear);
    lua_setglobal(L, "surface:clear");
    luaL_dofile(L, "script.lua");

    lua_getglobal(L, "onKey");

    const char* key = "up";
    const char* state = "repeat";
    lua_pushstring(L, key);
    lua_pushstring(L, state);

    lua_pcall(L, 2, 1, 0);

    lua_close(L);
}

/*
static int l_surface_clear(lua_State *L)
{
    double d = luaL_checknumber(L, 1);
    lua_pushnumber(L, sin(d)); // Push the result
    return 1;  // number of results
}*/

void EmulatorWindow::keyPressEvent(QKeyEvent *keyEvent)
{
    switch (keyEvent->key())
    {
        case (Qt::Key_Right):
            ui->textBrowser->setText("Pressing: Right");
            break;
        case (Qt::Key_A):
            ui->textBrowser->setText("Pressing: a hihi");
            break;
        default:
            ui->textBrowser->setText("Pressing: " + keyEvent->text());
    }

}

void EmulatorWindow::keyReleaseEvent(QKeyEvent *keyEvent)
{
    switch (keyEvent->key())
    {
        case (Qt::Key_Right):
            ui->textBrowser->setText("Released: Right");
            break;
        case (Qt::Key_A):
            ui->textBrowser->setText("Released: a hihi");
            break;
        default:
            ui->textBrowser->setText("Released: " + keyEvent->text());
    }
}

EmulatorWindow::~EmulatorWindow()
{
    delete ui;
}
