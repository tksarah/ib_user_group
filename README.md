# irohaboardへユーザとグループの流し込み

## リスト作成
以下のようなcsv作成（loginid , group name , user name）

```
# ./create_list.pl > listfile.txt
```

```
< listfile.txt > 
user1 , group1 , name1
user2 , group1 , name2
user3 , group2 , name3
```


## SQL ファイル作成
```
# ./outsql.pl listfile.txt
```

* userinput.sql
* ユーザの初期パスワードは"password"

```
# mysql -u root -phogehoge irohaboard < userinput.sql 
```
