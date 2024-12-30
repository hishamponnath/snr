import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:snr/model/accountprofilemodel.dart'; // Import the model

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  // Singleton constructor
  DatabaseHelper._init();

  // Get a reference to the database (create it if it doesn't exist)
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('accountprofiles.db'); // Initialize DB
    return _database!;
  }

  // Initialize the database (create tables)
  Future<Database> _initDB(String path) async {
    final dbPath = await getDatabasesPath();
    final dbFilePath = join(dbPath, path);
    return openDatabase(dbFilePath, version: 1, onCreate: _onCreate);
  }

  // Create table schema for account profiles
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE account_profiles (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        alterId INTEGER,
        pid TEXT,
        name TEXT,
        alias TEXT,
        userPid TEXT,
        userName TEXT,
        description TEXT,
        accountTypePid TEXT,
        accountTypeName TEXT,
        gstRegistrationType TEXT,
        locationRadius TEXT,
        address TEXT,
        city TEXT,
        location TEXT,
        pin TEXT,
        latitude TEXT,
        longitude TEXT,
        phone1 TEXT,
        phone2 TEXT,
        email1 TEXT,
        email2 TEXT,
        whatsAppNo TEXT,
        defaultPriceLevelPid TEXT,
        defaultPriceLevelName TEXT,
        accountStatus TEXT,
        importStatus INTEGER,
        creditDays INTEGER,
        creditLimit REAL,
        contactPerson TEXT,
        activated INTEGER,
        lastModifiedDate TEXT,
        createdDate TEXT,
        leadToCashStage TEXT,
        tinNo TEXT,
        closingBalance REAL,
        defaultDiscountPercentage REAL,
        trimChar TEXT,
        hasDefaultAccountInventory INTEGER,
        promptStockLocationInventory INTEGER,
        dataSourceType TEXT,
        stateName TEXT,
        countryName TEXT,
        districtName TEXT,
        geoTaggingType TEXT,
        geoTaggedTime TEXT,
        geoTaggedUserName TEXT,
        geoTaggedUserPid TEXT,
        geoTaggedUserLogin TEXT,
        customerId TEXT,
        countryId TEXT,
        customerCode TEXT,
        stateId TEXT,
        districtId TEXT,
        mailingName TEXT,
        employeeName TEXT,
        minVoucherDate TEXT,
        answers TEXT,
        geoTaggingStatus TEXT,
        territory TEXT,
        isImportStatus INTEGER,
        aitrichCode TEXT
      )
    ''');
  }

  // Fetch all profiles from the database
  Future<List<AccountProfileModel>> getAllProfiles() async {
    final db = await database;
    final res = await db.query('account_profiles');
    print('Fetched profiles from DB: $res'); // Log the fetched data
    return res.isNotEmpty
        ? res.map((json) => AccountProfileModel.fromJson(json)).toList()
        : [];
  }

  // Insert a list of account profiles into the database
  Future<void> insertAccountProfiles(List<AccountProfileModel> profiles) async {
    final db = await database;
    for (var profile in profiles) {
      print('Inserting profile: ${profile.toJson()}');
      await db.insert('account_profiles', profile.toJson());
    }
  }

  // Delete all profiles from the database
  Future<int> deleteAllProfiles() async {
    final db = await database;
    return await db.delete('account_profiles');
  }
}
