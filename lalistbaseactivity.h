#ifndef LALISTBASEACTIVITY_H
#define LALISTBASEACTIVITY_H
#include <string>
#include <QObject>
#include <QDebug>
#include <QString>
#include <string>
#include "listactivity.h"

namespace nScreen {
enum T {
    eInvalid = -1, //유효하지않은값
    eFront,  //전석
    eRearLeft, //후석 좌
    eRearRight, //후석 우
    eMax,  //유효하지않은값
};
}

class LalistBaseActivity : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString qml_name READ getDisplayName NOTIFY nameChanged)
    Q_PROPERTY(QString qml_phone READ getDisplayPhone NOTIFY phoneChanged)
    Q_PROPERTY(QString qml_opentime READ getDisplayOpenTime NOTIFY openTimeChanged)

public:
    LalistBaseActivity(QObject* parent = nullptr) ;
    virtual ~LalistBaseActivity();
public:
    void setScreen(nScreen::T ScreenName_In);

protected:
    virtual Q_INVOKABLE void onItemClicked(int index);

private:
    nScreen::T getScreen() const;
    void setData();
    void updateName(int m_clickedIndex);
    void updatePhone(int m_clickedIndex);
    void updateOpentime(int m_clickedIndex);
    QString getDisplayName() const;
    QString getDisplayPhone() const ;
    QString getDisplayOpenTime() const ;

signals:
    void nameChanged();
    void phoneChanged();
    void openTimeChanged();

protected:
     QList<FOOD_BOOK_ITEM> m_parsedData;
    int m_clickedIndex;
    nScreen::T m_select;
    QString qml_address;
    QString qml_subSymbol;
    QString qml_symbolCode;

private:
    QString qml_name;
    QString qml_phone;
    QString qml_opentime;

private:
    ListActivity listactivity;

};
#endif





