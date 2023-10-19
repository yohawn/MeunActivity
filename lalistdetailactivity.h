#ifndef LALISTDETAILACTIVITY_H
#define LALISTDETAILACTIVITY_H
#include "lalistbaseactivity.h"
#include <QObject>

class LalistDetailActivity : public LalistBaseActivity
{
    Q_OBJECT
    Q_PROPERTY(QString qml_address READ getDisplayAddress NOTIFY addressChanged)
    Q_PROPERTY(QString qml_symbolCode READ getDisplaySymbolCode NOTIFY symbolCodeChanged)
    Q_PROPERTY(QString qml_subSymbol READ getDisplaySubSymbol NOTIFY subSymbolChanged)


public:
    LalistDetailActivity(QObject *parent = nullptr);
    virtual ~LalistDetailActivity() override;

private:
    Q_INVOKABLE void onItemClicked(int index)override;
    void updateAddress(int m_clickedIndex);
    void updateSymbolCode(int m_clickedIndex);
    void updateSubSymbolCode(int m_clickedIndex);
    QString getDisplayAddress()const;
    QString getDisplaySymbolCode()const;
    QString getDisplaySubSymbol()const;

signals:
    void addressChanged();
    void symbolCodeChanged();
    void subSymbolChanged();
};

#endif // LALISTDETAILACTIVITY_H

