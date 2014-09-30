#ifndef EMULATORWINDOW_H
#define EMULATORWINDOW_H

#include <QDialog>
#include <QtCore>
#include <QtGui>
#include <QGraphicsScene>
#include <QGraphicsItem>
#include <QGraphicsRectItem>
#include "stbemulator.h"

extern "C" {
# include "lua/include/lua.h"
# include "lua/include/lauxlib.h"
# include "lua/include/lualib.h"
}

namespace Ui {
class EmulatorWindow;
}

class EmulatorWindow : public QDialog
{
    Q_OBJECT

public:
    explicit EmulatorWindow(QWidget *parent = 0);
    ~EmulatorWindow();
    //static int l_surface_clear(lua_State *L);

protected:
    void keyPressEvent(QKeyEvent *keyEvent);
    void keyReleaseEvent(QKeyEvent *keyEvent);

private:
    Ui::EmulatorWindow *ui;
    QGraphicsEllipseItem *ellipse;
    QGraphicsRectItem *rectangle;
    QGraphicsScene *scene;
};

#endif // EMULATORWINDOW_H
