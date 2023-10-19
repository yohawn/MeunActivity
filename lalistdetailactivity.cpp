#include "lalistdetailactivity.h"
LalistDetailActivity::LalistDetailActivity(QObject *parent) : LalistBaseActivity()
{
    parent = nullptr;
}
LalistDetailActivity::~LalistDetailActivity()
{

}
Q_INVOKABLE void LalistDetailActivity::onItemClicked(int index)
{
    qDebug() << "LalistDetailActivity::onItemClicked called " << index << "m_select: " << m_select;
    LalistBaseActivity::onItemClicked(index);
    if (m_select == nScreen::eFront)
    {
        updateAddress(m_clickedIndex);
        updateSymbolCode(m_clickedIndex);
    }
    else if (m_select == nScreen::eRearLeft)
    {
        updateSubSymbolCode(m_clickedIndex);
    }
    else if(m_select == nScreen::eRearRight )
    {
        updateSubSymbolCode(m_clickedIndex);
    }
}

void LalistDetailActivity::updateAddress(int m_clickedIndex)
{
    qml_address = m_parsedData[m_clickedIndex].add;
    qDebug() << "LalistBaseActivity::updateSymbolCode qml_address: " << qml_address;
    emit addressChanged();
}

void LalistDetailActivity::updateSymbolCode(int m_clickedIndex)
{
    qml_symbolCode = m_parsedData[m_clickedIndex].symbolCode;
    qDebug() << "LalistBaseActivity::updateSymbolCode qml_symbolCode: " << qml_symbolCode;
    emit symbolCodeChanged();
}

void LalistDetailActivity::updateSubSymbolCode(int m_clickedIndex)
{
    qml_subSymbol = m_parsedData[m_clickedIndex].symbolCode;
    qDebug() << "LalistDetailActivity::updateSubSymbolCode qml_symbolCode: " << qml_subSymbol;
    emit subSymbolChanged();
}

QString LalistDetailActivity::getDisplayAddress() const
{
    qDebug() << "LalistBaseActivity::setDisplayAddress::" << m_parsedData.isEmpty();
    return qml_address;
}

QString LalistDetailActivity::getDisplaySymbolCode() const
{

    qDebug() << "LalistBaseActivity::setDisplaySymbolCode::" << m_parsedData.isEmpty();
    return qml_symbolCode;
}

QString LalistDetailActivity::getDisplaySubSymbol() const
{
    qDebug() << "LalistBaseActivity::getDisplaySubSymbol::" << m_parsedData.isEmpty();
     return qml_subSymbol;
}



