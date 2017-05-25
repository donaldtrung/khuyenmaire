/****************************************************************************
** Meta object code from reading C++ file 'mydevice.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.3.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "sources/mydevice.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mydevice.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.3.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_MyDevice_t {
    QByteArrayData data[8];
    char stringdata[58];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MyDevice_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MyDevice_t qt_meta_stringdata_MyDevice = {
    {
QT_MOC_LITERAL(0, 0, 8),
QT_MOC_LITERAL(1, 9, 15),
QT_MOC_LITERAL(2, 25, 0),
QT_MOC_LITERAL(3, 26, 3),
QT_MOC_LITERAL(4, 30, 9),
QT_MOC_LITERAL(5, 40, 2),
QT_MOC_LITERAL(6, 43, 5),
QT_MOC_LITERAL(7, 49, 8)
    },
    "MyDevice\0isMobileChanged\0\0arg\0dpChanged\0"
    "dp\0value\0isMobile"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MyDevice[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       2,   38, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   29,    2, 0x06 /* Public */,
       4,    1,   32,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       5,    1,   35,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::QReal,    3,

 // methods: parameters
    QMetaType::QReal, QMetaType::Int,    6,

 // properties: name, type, flags
       7, QMetaType::Bool, 0x00495001,
       5, QMetaType::QReal, 0x00495001,

 // properties: notify_signal_id
       0,
       1,

       0        // eod
};

void MyDevice::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        MyDevice *_t = static_cast<MyDevice *>(_o);
        switch (_id) {
        case 0: _t->isMobileChanged((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 1: _t->dpChanged((*reinterpret_cast< qreal(*)>(_a[1]))); break;
        case 2: { qreal _r = _t->dp((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< qreal*>(_a[0]) = _r; }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (MyDevice::*_t)(bool );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MyDevice::isMobileChanged)) {
                *result = 0;
            }
        }
        {
            typedef void (MyDevice::*_t)(qreal );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MyDevice::dpChanged)) {
                *result = 1;
            }
        }
    }
}

const QMetaObject MyDevice::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_MyDevice.data,
      qt_meta_data_MyDevice,  qt_static_metacall, 0, 0}
};


const QMetaObject *MyDevice::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MyDevice::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MyDevice.stringdata))
        return static_cast<void*>(const_cast< MyDevice*>(this));
    return QObject::qt_metacast(_clname);
}

int MyDevice::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 3;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = isMobile(); break;
        case 1: *reinterpret_cast< qreal*>(_v) = dp(); break;
        }
        _id -= 2;
    } else if (_c == QMetaObject::WriteProperty) {
        _id -= 2;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        if (_id < 2)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void MyDevice::isMobileChanged(bool _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void MyDevice::dpChanged(qreal _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_END_MOC_NAMESPACE
