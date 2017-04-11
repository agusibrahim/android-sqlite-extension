# SQLite3 Extension for Android

## HOW TO USE?
Please use Native SQLite Library https://github.com/requery/sqlite-android, there is alot addtional function. DONT USE BUILTIN SQLITE

```java
SQLiteDatabaseConfiguration cfg=new SQLiteDatabaseConfiguration(DB_FILE, SQLiteDatabase.OPEN_READONLY);
SQLiteCustomExtension myext=new SQLiteCustomExtension(EXT_PATH, null);
cfg.customExtensions.add(myext);
SQLiteDatabase db=SQLiteDatabase.openDatabase(cfg, null, null);
```

Done, now you can use sql function from your extension.

## Credits:
* https://github.com/mateusza/SQLite-Levenshtein
* SQLite Source Code (https://sqlite.org/2017/sqlite-src-3180000.zip)
* https://github.com/evsukov89/SQLiteFuzzySearch

