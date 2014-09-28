#include "stbemulator.h"
#include <QPen>
#include <QBrush>

StbEmulator::StbEmulator(QGraphicsScene *scene)
{
    this->scene = scene;
}


int StbEmulator::surfaceClear()
{
    QPen pen(Qt::yellow);
    QBrush brush(Qt::red);
    this->scene->addEllipse(0,0,100,100,pen,brush);

    return 1;
}
