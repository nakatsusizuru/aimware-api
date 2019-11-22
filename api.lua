---
--- Title: Aimware API
--- Author: april#0001
--- Description: Localizes and simplifies the whole API
---

--- Localizes the entire API
--region api
--region globals
local globals = {
    tick_interval = globals.TickInverval,
    tick_count = globals.TickCount,
    real_time = globals.RealTime,
    cur_time = globals.CurTime,
    frame_count = globals.FrameCount,
    frame_time = globals.FrameTime,
    abs_frame_time = globals.AbsoluteFrameTime,
    max_clients = globals.MaxClients
}
--endregion

--region client
local client = {
    world_to_screen = client.WorldToScreen,
    cmd = client.Command,
    chat_say = client.ChatSay,
    chat_say_team = client.ChatTeamSay,
    allow_listener = client.AllowListener,
    name_by_index = client.GetPlayerNameByIndex,
    name_by_userid = client.GetPlayerNameByUserID,
    player_info = client.GetPlayerInfo,
    local_player_index = client.GetLocalPlayerIndex,
    set_cvar = client.SetConVar,
    get_cvar = client.GetConVar
}
--endregion

--region entities
local entities = {
    find_by_class = entities.FindByClass,
    local_player = entities.GetLocalPlayer,
    get_by_index = entities.GetByIndex,
    get_by_userid = entities.GetByUserID,
    player_resources = entities.GetPlayerResources
}
--endregion

--region callbacks
local callbacks = {
        add_callback = callbacks.Register,
        remove_callback = callbacks.Unregister
}
--endregion

--region draw
local draw = {
    color = draw.Color,
    line = draw.Line,
    rect = draw.FilledRect,
    outlined_rect = draw.OutlinedRect,
    round_rect = draw.RoundedRectFill,
    outlined_round_rect = draw.RoundedRect,
    triangle = draw.Triangle,
    circle = draw.Circle,
    outlined_circle = draw.OutlinedCircle,
    text = draw.Text,
    text_shadow = draw.TextShadow,
    text_size = draw.GetTextSize,
    add_font = draw.CreateFont,
    set_font = draw.SetFont,
    add_texture = draw.CreateTexture,
    update_texture = draw.UpdateTexture,
    set_texture = draw.SetTexture,
    screen_size = draw.GetScreenSize
}
--endregion

--region common
local common = {
    time = common.Time,
    decode_png = common.DecodePNG,
    decode_jpeg = common.DecodeJPEG,
    decode_svg = common.RasterizeSVG
}
--endregion

--region ui
local ui = {
    get_var = gui.GetValue,
    set_var = gui.SetValue,
    reference = gui.Reference,
    new_checkbox = gui.Checkbox,
    new_slider = gui.Slider,
    new_hotkey = gui.Keybox,
    new_combobox = gui.Combobox,
    new_textbox = gui.Editbox,
    new_label = gui.Text,
    new_groupbox = gui.Groupbox,
    new_color = gui.ColorEntry,
    new_window = gui.Window,
    new_button = gui.Button,
    new_multiselect = gui.Multibox,
    add_command = gui.Command,
    new_custom_instance = gui.Custom
}
--endregion

--region input
local input = {
    mouse_pos = input.GetMousePos,
    is_button_down = input.IsButtonDown,
    is_button_pressed = input.IsButtonPressed,
    is_button_released = input.IsButtonReleased
}
--endregion

--region engine
local engine = {
    trace_ray = engine.TraceLine,
    point_contents = engine.GetPointContents,
    map_name = engine.GetMapName,
    server_ip = engine.GetServerIP
}
--endregion

--region file_system
local file_system = {
    open = file.Open,
    delete = file.Delete
}
--endregion

--region http
local http = {
    get = http.Get
}
--endregion

--region vector
local vector = {
    add = vector.Add,
    sub = vector.Substract,
    multiply = vector.Multiply,
    divide = vector.Divide,
    len = vector.Length,
    len_sqr = vector.LengthSqr,
    dist = vector.Distance,
    normalize_vector = vector.Normalize,
    angles = vector.Angles,
    normalize_angles = vector.AngleNormalize,
    fwrd = vector.AngleForward,
    right = vector.AngleRight,
    up = vector.AngleUp
}
--endregion

--region net
local net = {
    new_socket = network.Socket,
    address_info = network.GetAddrInfo,
    name_info = network.GetNameInfo
}
--endregion
--endregion

--- Localizes the classes and its functions
--region classes
--region Entity
-- Creates our Entity class
--- @class Entity
local ent = {}

--- Returns the name of an entity
--- @param e
--- @return string
function ent.name(e)
    return e:GetName()
end

--- Returns the class name of an entity
--- @param e
--- @return string
function ent.class(e)
    return e:GetClass()
end

--- Returns the index of an entity
--- @param e
--- @return number
function ent.index(e)
    return e:GetIndex()
end

--- Returns the team number of a player
--- @param e
--- @return number
function ent.team(e)
    return e:GetTeamNumber()
end

--- Returns the origin vector of an entity
--- @param e
--- @return table
function ent.origin(e)
    return {e:GetAbsOrigin()}
end

--- Returns the origin vector's values of an entity
--- @param e
--- @return number, number, number
function ent.origin_unpacked(e)
    return table.unpack({e:GetAbsOrigin()})
end

--- Returns the minimal vector of an entity
--- @param e
--- @return table
function ent.min(e)
    return e:GetMins()
end

--- Returns the maximal vector of an entity
--- @param e
--- @return table
function ent.max(e)
    return e:GetMaxs()
end

--- Returns the health value of an entity
--- @param e
--- @return number
function ent.hp(e)
    return e:GetHealth()
end

--- Returns the maximum health value of an entity
--- @param e
--- @return number
function ent.max_hp(e)
    return e:GetMaxHealth()
end

--- Checks whether an entity is a player (CCSPlayer) or not
--- @param e
--- @return boolean
function ent.is_player(e)
    return e:IsPlayer()
end

--- Checks whether an entity is alive or not
--- @param e
--- @return boolean
function ent.is_alive(e)
    return e:IsAlive()
end

--- Returns a property from an entity
--- @param e
--- @param prop
--- @return any
function ent.get_prop(e, prop, ...)
    return e:GetProp(prop, ...)
end

--- Changes the property of an entity
--- @param e
--- @param prop
--- @param value
--- @return void
function ent.set_prop(e, prop, value)
    return e:SetProp(prop, value)
end

--- Returns the position vector of a hitgroup of an entity
--- @param e
--- @param hitgroup
--- @return table
function ent.hitbox_position(e, hitgroup)
    return {e:GetHitboxPosition(hitgroup)}
end

--- Returns the position's vector values of a hitgroup of an entity
--- @param e
--- @param hitgroup
--- @return number, number, number
function ent.hitbox_position_unpacked(e, hitgroup)
    return table.unpack({e:GetHitboxPosition(hitgroup)})
end

--- Returns the position vector of a bone of an entity
--- @param e
--- @param bone_idx
--- @return table
function ent.bone_position(e, bone_idx)
    return {e:GetBonePosition(bone_idx)}
end

--- Returns the position's vector values of a bone of an entity
--- @param e
--- @param bone_idx
--- @return number, number, number
function ent.bone_position_unpacked(e, bone_idx)
    return table.unpack({e:GetBonePosition(bone_idx)})
end

--- Returns the player's weapon ID
--- @param e
--- @return number
function ent.weapon_id(e)
    return e:GetWeaponID()
end

--- Returns the player's weapon group
--- @param e
--- @return string
function ent.weapon_type(e)
    return e:GetWeaponType()
end

--- Returns the player's weapon spread amount
--- @param e
--- @return number
function ent.weapon_spread(e)
    return e:GetWeaponSpread()
end

--- Returns the player's weapon inaccuracy amount
--- @param e
--- @return number
function ent.weapon_inaccuracy(e)
    return e:GetWeaponInaccuracy()
end
--endregion

--region EspBuilder
--- @class EspBuilder
local esp = {}

--- Sets the color of the next EspBuilder element to be drawn
--- @param builder
--- @param r
--- @param g
--- @param b
--- @param a
--- @return void
function esp.color(builder, r, g, b, a)
    return builder:Color(r, g, b, a)
end

--- Returns the EspBuilder's current entity
--- @param builder
--- @return Entity
function esp.get_entity(builder)
    return builder:GetEntity()
end

--- Returns the mins and maxs of the EspBuilder's entity box
--- @param builder
--- @return table
function esp.get_rect(builder)
    return {builder:GetRect()}
end

--- Returns the mins and maxs values of the EspBuilder's entity box
--- @param builder
--- @return number, number, number, number
function esp.get_rect_unpacked(builder)
    return table.unpack({builder:GetRect()})
end

--- Adds an text on top of the entity's box
--- @param builder
--- @return void
function esp.add_text_top(builder, text)
    return builder:AddTextTop(text)
end

--- Adds an text under of the entity's box
--- @param builder
--- @return void
function esp.add_text_bottom(builder, text)
    return builder:AddTextBottom(text)
end

--- Adds an bar on top of the entity's box
--- @param builder
--- @return void
function esp.add_bar_top(builder, amount)
    return builder:AddBarTop(amount)
end

--- Adds an bar under of the entity's box
--- @param builder
--- @return void
function esp.add_bar_bottom(builder, amount)
    return builder:AddBarBottom(amount)
end

--- Adds an bar on the left side of the entity's box
--- @param builder
--- @return void
function esp.add_bar_left(builder, amount)
    return builder:AddBarLeft(amount)
end

--- Adds an bar on the right side of the entity's box
--- @param builder
--- @return void
function esp.add_bar_right(builder, amount)
    return builder:AddBarRight(amount)
end
--endregion

--region UserCmd
--- @class UserCmd
local cmd = {}

--- Returns the view angles vector
--- @param usercmd
--- @return table
function cmd.get_view_angles(usercmd)
    return {usercmd:GetViewAngles()}
end

--- Sets the view angles of a UserCmd
--- @param usercmd
--- @param pitch
--- @param yaw
--- @param roll
--- @return void
function cmd.set_view_angles(usercmd, pitch, yaw, roll)
    return usercmd:SetViewAngles(pitch, yaw, roll)
end

--- Returns the view angles vector's values
--- @param usercmd
--- @return number, number, number
function cmd.get_view_angles_unpacked(usercmd)
    return table.unpack({usercmd:GetViewAngles()})
end

--- Returns the current send packet status
--- @param usercmd
--- @return boolean
function cmd.get_send_packet(usercmd)
    return usercmd:GetSendPacket()
end

--- Sets the current send packet status
--- @param usercmd
--- @param value
--- @return void
function cmd.allow_send_packet(usercmd, value)
    return usercmd:SetSendPacket(value)
end

--- Returns the current button data
--- @param usercmd
--- @return any
function cmd.get_buttons(usercmd)
    return usercmd:GetButtons()
end

--- Sets the current button data
--- @param usercmd
--- @param buttons
--- @return void
function cmd.set_buttons(usercmd, buttons)
    return usercmd:SetButtons(buttons)
end

--- Returns the current forward movement value
--- @param usercmd
--- @return number
function cmd.get_fwrd_move(usercmd)
    return usercmd:GetForwardMove()
end

--- Sets the forward movement value
--- @param usercmd
--- @param value
--- @return void
function cmd.set_frwd_move(usercmd, value)
    return usercmd:SetForwardMove(value)
end

--- Returns the current side movement value
--- @param usercmd
--- @return number
function cmd.get_side_move(usercmd)
    return usercmd:GetSideMove()
end

--- Sets the side movement value
--- @param usercmd
--- @param value
--- @return void
function cmd.set_side_move(usercmd, value)
    return usercmd:SetSideMove(value)
end

--- Returns the current up movement value
--- @param usercmd
--- @return number
--- @deprecated
function cmd.get_up_move(usercmd)
    return usercmd:GetUpMove()
end

--- Sets the up movement value
--- @param usercmd
--- @param value
--- @return void
--- @deprecated
function cmd.set_up_move(usercmd, value)
    return usercmd:SetUpMove(value)
end
--endregion

--region GameEvent
--- @class GameEvent
local event = {}

--- Returns the GameEvent's name
--- @param ev
--- @return string
function event.name(ev)
    return ev:GetName()
end

--- Returns a GameEvent's string property
--- @param ev
--- @param field
--- @return string
function event.string(ev, field)
    return ev:GetString(field)
end

--- Returns a GameEvent's integer property
--- @param ev
--- @param field
--- @return number
function event.int(ev, field)
    return ev:GetInt(field)
end

--- Returns a GameEvent's float property
--- @param ev
--- @param field
--- @return number
function event.float(ev, field)
    return ev:GetFloat(field)
end

--endregion

--region GuiObject
-- UI class already declared

--- Returns the value of a menu object
--- @param obj
--- @return any
function ui.get(obj)
    return obj:GetValue()
end

--- Sets the value of a menu object
--- @param obj
--- @param value
--- @return void
function ui.set(obj, value)
    return obj:SetValue(value)
end

--- Sets the visibility of a window
--- @param window
--- @param value
--- @return void
function ui.set_visible(window, value)
    return window:SetActive(value)
end

--- Returns the visibility of a window
--- @param window
--- @return boolean
function ui.is_visible(window)
    return window:IsActive()
end

--- Changes the text of a Label menu element
--- @param obj
--- @param text
--- @return void
function ui.set_text(obj, text)
    return obj:SetText(text)
end
--endregion

--region File
--- @class File
local file = {}

--- Reads a file
--- @param obj
--- @return any
function file.read(obj)
    return obj:Read()
end

--- Writes on a file
--- @param obj
--- @param data
--- @return void
function file.write(obj, data)
    return obj:Write(data)
end

--- Returns the size of a file
--- @param obj
--- @return number
function file.size(obj)
    return obj:Size()
end

--- Closes a file
--- @param obj
--- @return void
function file.close(obj)
    return obj:Close()
end
--endregion

--region UserMsg
--- @class UserMsg
local msg = {}

--- Returns the index of a message
--- @param obj
--- @return number
function msg.index(obj)
    return obj:GetID()
end

--- Returns a UserMsg's integer property
--- @param obj
--- @param idx
--- @param repeated_idx
--- @return number
function msg.int(obj, idx, repeated_idx)
    return obj:GetInt(idx, repeated_idx)
end

--- Returns a UserMsg's float property
--- @param obj
--- @param idx
--- @param repeated_idx
--- @return number
function msg.float(obj, idx, repeated_idx)
    return obj:GetFloat(idx, repeated_idx)
end

--- Returns a UserMsg's string property
--- @param obj
--- @param idx
--- @param repeated_idx
--- @return string
function msg.string(obj, idx, repeated_idx)
    return obj:GetString(idx, repeated_idx)
end
--endregion

--region StringCmd
--- @class StringCmd
local cvar = {}

--- Gets the value of a cvar
--- @param obj
--- @return any
function cvar.get(obj)
    return obj:Get()
end

--- Sets the value of a cvar
--- @param obj
--- @param command
--- @return void
function cvar.set(obj, command)
    return obj:Set(command)
end
--endregion

--region Socket
--- @class Socket
local socket = {}

--- Binds a socket to an IP address
--- @param obj
--- @param address
--- @param port
--- @return void
function socket.bind(obj, address, port)
    return obj:Bind(address, port)
end

--- Sends data to an IP address
--- @param obj
--- @param address
--- @param port
--- @param data
--- @return void
function socket.send(obj, address, port, data)
    return obj:SendTo(address, port, data)
end

--- Receives data from an IP address
--- @param obj
--- @param address
--- @param port
--- @param size
--- @return any
function socket.receive(obj, address, port, size)
    return obj:RecvFrom(address, port, size)
end

--- Terminates a socket
--- @param obj
--- @return void
function socket.close(obj)
    return obj:Close()
end
--endregion
--endregion
