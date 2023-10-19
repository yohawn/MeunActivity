#ifndef LISTACTIVITY_H
#define LISTACTIVITY_H
#include <QObject>
#include <QAbstractListModel>
#include <json/json.hpp>
#include <json/json_fwd.hpp>
#include <QList>
#include <string>
#include <QDebug>
#include <QString>
struct FOOD_BOOK_ITEM
{
    QString Name;
    QString add ;
    QString phone;
    QString opentime;
    QString symbolCode;
    QString subSymbol;

    FOOD_BOOK_ITEM(const QString& Names,const QString& address,const QString& phones,const QString& opentimes,const QString& symbolCodes,const QString& subSymbols )
    {
        Name = Names;
        add = address;
        phone = phones;
        opentime = opentimes;
        symbolCode = symbolCodes;
        subSymbol = subSymbols;
    }

};

class ListActivity  : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int indexNumber READ getIndexNumber NOTIFY changeIndexNumber)

    enum class ColumnNames {
        name = Qt::UserRole,
        add,
        phone,
        opentime,
        symbolCode,
        subSymbol
    };
public:
    ListActivity(QObject *parent=nullptr);
    virtual ~ListActivity();
    QList<FOOD_BOOK_ITEM> sendParsedData() const;

private:
    void setParseData();
    int rowCount(const QModelIndex & = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int Role) const;
    QHash<int, QByteArray> roleNames() const;
    void setRestaurantList(QList<FOOD_BOOK_ITEM> &restaurantList);

private slots :
    int getIndexNumber() const;

signals:
    void changeIndexNumber();

private:
    QList<FOOD_BOOK_ITEM> m_restaurantList;
};


#endif // MYDATAMODEL_H
