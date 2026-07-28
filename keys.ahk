#singleinstance force	; 跳过对话框并自动替换旧实例
#usehook

global status := true
global spaceLayer := false

; 条件热键不能直接使用 a::b 形式的重映射。重映射会被展开为
; “目标键按下/目标键松开”两个热键；如果先松开层按键，#HotIf 条件
; 会在源按键松开前失效，目标键的 Up 事件便可能丢失，造成按键卡住。
; 改为一次发送完整的按下和松开事件，物理键自动重复时仍可连续触发。
tapKey(key) {
	send("{Blind}" key)
}

^!k::{
	global status, spaceLayer
	status := !status
	; 关闭功能时清理层状态，避免在按住 Space 时切换造成状态残留。
	if !status
		spaceLayer := false
}

;第二层
;数字，f区，符号
#HotIf status 
~\::reload

*Space::{
	global spaceLayer
	; 通用的 *Space 热键优先于后面 #HotIf 中的同名变体，
	; 因此 Tab+Space 必须在这里先处理。
	if GetKeyState("Tab", "p") {
		tapKey("{Tab}")
		return
	}
	; 用按键事件锁定第二层，避免快速连按时反复查询物理状态而漏判。
	spaceLayer := true
}

*Space up::{
	global spaceLayer
	spaceLayer := false
	if (A_Priorkey == "Space" && !GetKeyState("`;","p") && !GetKeyState("tab","p")){
		send ("{blind}{Space}")
	}
}

;第三层
;方向，鼠标，编辑，音量
*`; up::{
	if (A_Priorkey == "`;" && !GetKeyState("space","p") && !GetKeyState("tab","p")){
		send ("{blind}{`;}")
	}
	global status
	speed := 5
}

;第四层
;宏 f区
*Tab up::{
	if (A_Priorkey == "Tab" && !GetKeyState("space","p") && !GetKeyState("`;","p")){
		send ("{blind}{Esc}")
	}
}

;第二层
#HotIf status && spaceLayer
	*tab::tapKey("``")
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

;第三层
#HotIf status && GetKeyState("`;","p")
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

	;第四层
#HotIf status && GetKeyState("tab","p")
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
