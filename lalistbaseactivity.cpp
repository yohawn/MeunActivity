#include "lalistbaseactivity.h"
#include <QDebug>
LalistBaseActivity::LalistBaseActivity(QObject* parent) : QObject(parent), m_select(nScreen::T::eInvalid)
{
}
LalistBaseActivity::~LalistBaseActivity()
{
}
void LalistBaseActivity::setScreen(nScreen::T ScreenName_In)
{
    m_select = ScreenName_In;
}
void LalistBaseActivity::setData()
{
    QList<FOOD_BOOK_ITEM> Data = listactivity.sendParsedData();
    m_parsedData = Data;
}
Q_INVOKABLE void LalistBaseActivity::onItemClicked(int index)
{
    qDebug() << "LalistBaseActivity::onItemClicked called " << index << "m_select: " << m_select;
    setData();
    m_clickedIndex = index;
    if (-1 != m_clickedIndex && m_clickedIndex < m_parsedData.size()) {
        updateName(m_clickedIndex);
        updatePhone(m_clickedIndex);
        updateOpentime(m_clickedIndex);
    }
    else {
        qDebug() << "LalistBaseActivity::onItemClicked, error !!";
    }

}
void LalistBaseActivity::updateName(int m_clickedIndex)
{
    qml_name = m_parsedData[m_clickedIndex].Name;
    qDebug() << "LalistBaseActivity::updateSymbolCode qml_name: " << qml_name;
    emit nameChanged();
}

void LalistBaseActivity::updatePhone(int m_clickedIndex)
{
    qml_phone = m_parsedData[m_clickedIndex].phone;
    qDebug() << "LalistBaseActivity::updateSymbolCode qml_phone: " << qml_phone;
    emit phoneChanged();
}

void LalistBaseActivity::updateOpentime(int m_clickedIndex)
{
    qml_opentime = m_parsedData[m_clickedIndex].opentime;
    qDebug() << "LalistBaseActivity::updateSymbolCode qml_opentime: " << qml_opentime;
    emit openTimeChanged();
}
QString LalistBaseActivity::getDisplayName() const
{
    qDebug() << "LalistBaseActivity::setDisplayName::" << m_parsedData.isEmpty();
    return qml_name;
}

QString LalistBaseActivity::getDisplayPhone() const
{
    qDebug() << "LalistBaseActivity::setDisplayAddress::" << m_parsedData.isEmpty();
    return qml_phone;
}
QString LalistBaseActivity::getDisplayOpenTime() const
{
   qDebug() << "LalistBaseActivity::setDisplayOpenTime::" << m_parsedData.isEmpty();
   return qml_opentime;
}




