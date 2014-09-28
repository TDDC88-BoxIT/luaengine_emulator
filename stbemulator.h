#ifndef STBEMULATOR_H
#define STBEMULATOR_H

#include <QGraphicsScene>

class StbEmulator
{
public:
    StbEmulator(QGraphicsScene *scene);
    int surfaceClear();
private:
    QGraphicsScene *scene;
};

#endif // STBEMULATOR_H
