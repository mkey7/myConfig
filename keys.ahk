#SingleInstance Force
#UseHook

; AutoHotkey v2
; 完整切层状态机：只允许一个活动层，但会记录所有层键的真实状态。
global status := true
global activeLayer := ""
global layerSequence := 0
global layerState := Map(
    "space",     { key: "Space", tap: "{Space}", held: false, used: false, order: 0 },
    "semicolon", { key: ";",     tap: "`;",      held: false, used: false, order: 0 },
    "tab",       { key: "Tab",   tap: "{Tab}",   held: false, used: false, order: 0 }
)

; 条件热键不能直接使用 a::b 形式的重映射；它可能在层键先松开时丢失
; 目标键的 Up 事件。这里每次都发送完整的按下/松开序列。
tapKey(key) {
    global activeLayer, layerState
    if (activeLayer != "")
        layerState[activeLayer].used := true
    Send("{Blind}" key)
}

; 返回仍按住的候选层中最早按下的一个。固定的顺序避免快速连按时跳层。
nextHeldLayer() {
    global layerState
    nextName := ""
    nextOrder := 0
    for name, state in layerState {
        if (!state.held)
            continue
        if (!nextOrder || state.order < nextOrder) {
            nextName := name
            nextOrder := state.order
        }
    }
    return nextName
}

; 层键按下：第一个键取得控制权；其它键保留为候选层。
; 两个层键形成组合后，两者都不再视为“单击”，松开时不会泄漏原键。
pressLayer(name) {
    global activeLayer, layerSequence, layerState
    state := layerState[name]
    if (state.held) ; 忽略按住期间产生的自动重复 Down 事件。
        return

    state.held := true
    state.used := false
    state.order := ++layerSequence
    if (activeLayer = "") {
        activeLayer := name
        return
    }

    layerState[activeLayer].used := true
    state.used := true
}

; 层键松开：若它是当前层，则让仍按住的候选层接管。
; A_PriorKey 额外确保只有真正的单击才发送 Space/`;/Esc；按过未映射键时
; 不会多输入层键。
releaseLayer(name) {
    global activeLayer, layerState
    state := layerState[name]
    if (!state.held)
        return

    state.held := false
    wasActive := (activeLayer = name)
    if (wasActive)
        activeLayer := nextHeldLayer()

    shouldTap := !state.used && (A_PriorKey = state.key)
    state.used := false
    state.order := 0
    if (shouldTap)
        Send("{Blind}" state.tap)
}

; 关闭或重载时清空内存状态，物理按键的后续 Up 事件会被安全忽略。
resetLayers() {
    global activeLayer, layerSequence, layerState
    activeLayer := ""
    layerSequence := 0
    for _, state in layerState {
        state.held := false
        state.used := false
        state.order := 0
    }
}

^!k::{
    global status
    status := !status
    if (!status)
        resetLayers()
}

#HotIf status
~\::{
    resetLayers()
    Reload()
}

; 层键的 Down / Up 由状态机处理；当某层把另一层键定义为映射时，
; 该映射优先，层键不会再次参与状态机。
#HotIf status && (activeLayer != "tab")
*Space::pressLayer("space")

; Space 层中的 Tab / `; 是映射键；其它场景下它们才是候选层键。
#HotIf status && (activeLayer != "space")
*`;::pressLayer("semicolon")
*Tab::pressLayer("tab")

#HotIf status
*Space Up::releaseLayer("space")
*`; Up::releaseLayer("semicolon")
*Tab Up::releaseLayer("tab")

; 第二层：数字、F 区和符号
#HotIf status && (activeLayer = "space")
*Tab::tapKey("``")
*q::tapKey("1")
*w::tapKey("2")
*e::tapKey("3")
*a::tapKey("4")
*s::tapKey("5")
*d::tapKey("6")
*z::tapKey("7")
*x::tapKey("8")
*c::tapKey("9")
*v::tapKey("0")
*r::tapKey("{F1}")
*t::tapKey("{F2}")
*y::tapKey("{F3}")
*u::tapKey("{F4}")
*f::tapKey("{F5}")
*g::tapKey("{F6}")
*h::tapKey("{F7}")
*j::tapKey("{F8}")
*,::tapKey("{F9}")
*m::tapKey("{F10}")
*n::tapKey("{F11}")
*b::tapKey("{F12}")
*i::tapKey("[")
*o::tapKey("]")
*p::tapKey("\")
*[::tapKey("{Backspace}")
*k::tapKey("-")
*l::tapKey("=")
*.::tapKey("/")
*`;::tapKey("'")
*'::tapKey("{Enter}")
*/::tapKey("{Delete}")

; 第三层：方向、编辑和媒体控制
#HotIf status && (activeLayer = "semicolon")
*h::tapKey("{Left}")
*j::tapKey("{Down}")
*k::tapKey("{Up}")
*l::tapKey("{Right}")
*n::tapKey("{Home}")
*m::tapKey("{PgDn}")
*,::tapKey("{PgUp}")
*.::tapKey("{End}")
*u::tapKey("{Volume_Mute}")
*i::tapKey("{Volume_Down}")
*o::tapKey("{Volume_Up}")
*p::tapKey("{Media_Play_Pause}")
*f::tapKey("{Tab}")
*s::tapKey("{Escape}")
*d::tapKey("{Backspace}")

; 第四层：F1–F12
#HotIf status && (activeLayer = "tab")
*Space::tapKey("{Esc}")
*q::tapKey("{F1}")
*w::tapKey("{F2}")
*e::tapKey("{F3}")
*r::tapKey("{F4}")
*a::tapKey("{F5}")
*s::tapKey("{F6}")
*d::tapKey("{F7}")
*f::tapKey("{F8}")
*z::tapKey("{F9}")
*x::tapKey("{F10}")
*c::tapKey("{F11}")
*v::tapKey("{F12}")

#HotIf
