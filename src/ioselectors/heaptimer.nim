import std/monotimes, heapqueue, options


# {.pragma: libKernel32, stdcall, dynlib: "Kernel32.dll".}

# proc queryPerformanceCounter*(
#   lpPerformanceCount: var uint
# ): WINBOOL {.libKernel32, importc: "QueryPerformanceCounter".}

# proc queryPerformanceFrequency*(
#   lpFrequency: var uint
# ): WINBOOL {.libKernel32, importc: "QueryPerformanceFrequency".}


type
  Callback* = proc () {.gcsafe.}

  TimerCallback* = object
    finishAt*: MonoTime
    callback*: Callback

  Timer* = object
    data: HeapQueue[TimerCallback]


proc processTimer*(timer: Timer): Option[int] {.inline.} =
  let
    count = timer.data.len
    now = getMonoTime()

  if count > 0 and timer.data[0].finishAt <= now:
    discard