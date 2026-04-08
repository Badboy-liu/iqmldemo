//
// Created by loukas on 2026/4/7.
//

#include "UserDao.h"




PageResult<User> UserDao::queryAll(const std::shared_ptr<UserPageReq> req)
{
    PageResult<User> result;

    const auto db = DatabaseManager::getConnection();
    QSqlQuery query(db);

    int offset = (req->pageNo - 1) * req->pageSize;

    QString sql = "SELECT id, name, age FROM users ";

    if (!req->keyword.isEmpty()) {
        sql += "WHERE name LIKE '%' || :keyword || '%' ";
    }

    sql += "LIMIT :limit OFFSET :offset";

    if (!query.prepare(sql)) {
        qDebug() << "prepare error:" << query.lastError();
        return result;
    }

    if (!req->keyword.isEmpty())
        query.bindValue(":keyword", req->keyword);

    query.bindValue(":limit", req->pageSize);
    query.bindValue(":offset", offset);

    if (!query.exec()) {
        qDebug() << "exec error:" << query.lastError();
        return result;
    }

    while (query.next()) {
        result.records.append(User{
            query.value("id").toInt(),
            query.value("name").toString(),
            query.value("age").toInt(),
        });
    }

    // ✅ 查询总数
    result.total = count(req);

    return result;


}
int UserDao::count(const std::shared_ptr<UserPageReq> req)
{
    const auto db = DatabaseManager::getConnection();
    QSqlQuery query(db);

    QString sql = "SELECT COUNT(*) FROM users ";

    if (!req->keyword.isEmpty()) {
        sql += "WHERE name LIKE '%' || :keyword || '%'";
    }

    query.prepare(sql);

    if (!req->keyword.isEmpty())
        query.bindValue(":keyword", req->keyword);

    if (!query.exec()) {
        qDebug() << query.lastError();
        return 0;
    }

    if (query.next())
        return query.value(0).toInt();

    return 0;
}

void UserDao::updateUser(int id, const QString& name, int age)
{
    QSqlQuery query(DatabaseManager::getConnection());

    query.prepare("UPDATE users SET name=:name, age=:age WHERE id=:id");
    query.bindValue(":name", name);
    query.bindValue(":age", age);
    query.bindValue(":id", id);

    query.exec();
}

void UserDao::addUser(const QString& name, int age)
{
    QSqlQuery query(DatabaseManager::getConnection());

    query.prepare("INSERT INTO users(name, age) VALUES(:name, :age)");
    query.bindValue(":name", name);
    query.bindValue(":age", age);

    if (!query.exec()) {
        qDebug() << query.lastError();
    }
}
