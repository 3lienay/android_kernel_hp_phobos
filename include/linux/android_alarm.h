#ifndef _LINUX_ANDROID_ALARM_H
#define _LINUX_ANDROID_ALARM_H

#include <linux/ioctl.h>
#include <linux/time.h>

enum android_alarm_type {
    ANDROID_ALARM_RTC_WAKEUP,
    ANDROID_ALARM_RTC,
    ANDROID_ALARM_ELAPSED_REALTIME_WAKEUP,
    ANDROID_ALARM_ELAPSED_REALTIME,
    ANDROID_ALARM_SYSTEMTIME,
    ANDROID_ALARM_TYPE_COUNT,
};

enum android_alarm_return_flags {
    ANDROID_ALARM_RTC_WAKEUP_MASK = 1U << ANDROID_ALARM_RTC_WAKEUP,
    ANDROID_ALARM_RTC_MASK = 1U << ANDROID_ALARM_RTC,
    ANDROID_ALARM_ELAPSED_REALTIME_WAKEUP_MASK = 1U << ANDROID_ALARM_ELAPSED_REALTIME_WAKEUP,
    ANDROID_ALARM_ELAPSED_REALTIME_MASK = 1U << ANDROID_ALARM_ELAPSED_REALTIME,
    ANDROID_ALARM_SYSTEMTIME_MASK = 1U << ANDROID_ALARM_SYSTEMTIME,
    ANDROID_ALARM_TIME_CHANGE_MASK = 1U << 16
};

#define ANDROID_ALARM_CLEAR(type)           _IO('a', 0 | ((type) << 4))
#define ANDROID_ALARM_WAIT                  _IO('a', 1)
#define ANDROID_ALARM_SET(type)             _IOW('a', 2, struct timespec)
#define ANDROID_ALARM_SET_AND_WAIT(type)    _IOW('a', 3, struct timespec)
#define ANDROID_ALARM_GET_TIME(type)        _IOW('a', 4, struct timespec)
#define ANDROID_ALARM_SET_RTC               _IOW('a', 5, struct timespec)
#define ANDROID_ALARM_BASE_CMD(cmd)         (cmd & ~(_IOC(0, 0, 0xf0, 0)))
#define ANDROID_ALARM_IOCTL_TO_TYPE(cmd)    (_IOC_NR(cmd) >> 4)

#define ANDROID_ALARM_VERSION_CODE 0x00010008 /* Android 8.x (Oreo) */

#endif
