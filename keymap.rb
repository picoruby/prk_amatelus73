kbd = Keyboard.new

c1 = 29
c2 = 28
c3 = 27
c4 = 26
c5 = 22
c6 = 20
c7 = 23
c8 = 21
r1 = 4
r2 = 5
r3 = 6
r4 = 7
r5 = 8

kbd.init_matrix_pins(
  [
    [ [r1,c1],  [c1,r1],  [r1,c2], [c2,r1],    [r1,c3],    [c3,r1],  [r1,c4], [c4,r1],  [r1,c5],  [c5,r1],  [r1,c6],  [c6,r1],  [r1,c7], [c7,r1],  [r1,c8],  [c8,r1] ],
    [ [r2,c1],  [c1,r2],  [r2,c2], [c2,r2],    [r2,c3],    [c3,r2],  [r2,c4], [c4,r2],  [r2,c5],  [c5,r2],  [r2,c6],  [c6,r2],  [r2,c7], [c7,r2],  [r2,c8],  [c8,r2] ],
    [     nil,  [c1,r3],  [r3,c2], [c2,r3],    [r3,c3],    [c3,r3],  [r3,c4], [c4,r3],  [r3,c5],  [c5,r3],  [r3,c6],  [c6,r3],  [r3,c7], [c7,r3],  [r3,c8],      nil ],
    [ [r4,c1],  [c1,r4],  [r4,c2], [c2,r4],    [r4,c3],    [c3,r4],  [r4,c4], [c4,r4],  [r4,c5],  [c5,r4],  [r4,c6],  [c6,r4],  [r4,c7], [c7,r4],  [r4,c8],  [c8,r4] ],
    [ [r5,c1],  [c1,r5],      nil,     nil,    [r5,c3],    [c3,r5],  [r5,c4],     nil,  [r5,c5],  [c5,r5],  [r5,c6],      nil,      nil, [c7,r5],  [r5,c8],  [c8,r5] ],
  ]
)

kbd.add_layer :default, %i[
      KC_PGUP   KC_ESCAPE KC_GRAVE KC_1        KC_2        KC_3      KC_4     KC_5      KC_6      KC_7      KC_8      KC_9      KC_0     KC_MINUS  KC_PLUS   KC_BSPACE
      KC_PGDOWN KC_ESCAPE KC_Q     KC_W        KC_E        KC_R      KC_T     KC_NO     KC_NO     KC_Y      KC_U      KC_I      KC_O     KC_P      KC_MINUS  KC_DELETE
                KC_TAB    KC_A     KC_S        KC_D        KC_F      KC_G     KC_NO     KC_NO     KC_H      KC_J      KC_K      KC_L     KC_SCOLON KC_BSPACE
      KC_LSFT   KC_Z      KC_X     KC_C        KC_V        KC_B      KC_NO    KC_NO     KC_NO     KC_N      KC_M      KC_COMMA  KC_DOT   KC_SLASH  KC_RSFT   KC_RSFT
      RGB_MOD   KC_LALT                        KC_LCTL     LOWER_SPC KC_LALT            KC_RGUI   RAISE_ENT SPC_CTL                      RGB_HUI   RGB_SAI   GUI_JP
]
kbd.add_layer :raise, %i[
  KC_PGUP   KC_ESCAPE KC_GRAVE KC_F1       KC_F2       KC_F3     KC_F4    KC_F5     KC_F6     KC_F7     KC_F8     KC_F9     KC_F10   KC_F11    KC_F12    KC_BSPACE
  KC_PGDOWN KC_GRAVE  KC_EXLM  KC_AT       KC_HASH     KC_DLR    KC_PERC  KC_NO     KC_NO     KC_CIRC   KC_AMPR   KC_ASTER  KC_LPRN  KC_RPRN   KC_EQUAL  KC_DELETE
            KC_TAB    KC_LABK  KC_LCBR     KC_LBRACKET KC_LPRN   KC_QUOTE KC_NO     KC_NO     KC_LEFT   KC_DOWN   KC_UP     KC_RIGHT KC_UNDS   KC_PIPE
  KC_LSFT   KC_RABK   KC_RCBR  KC_RBRACKET KC_RPRN     KC_DQUO   KC_NO    KC_NO     KC_NO     KC_TILD   KC_BSLASH KC_COMMA  KC_DOT   KC_SLASH  KC_RSFT   KC_RSFT
  RGB_MOD   KC_LALT                        KC_LCTL     LOWER_SPC KC_LALT            KC_RGUI   RAISE_ENT SPC_CTL                      RGB_HUI   RGB_SAI   GUI_JP
]
kbd.add_layer :lower, %i[
  KC_PGUP   KC_ESCAPE KC_GRAVE KC_F1       KC_F2       KC_F3     KC_F4    KC_F5     KC_F6     KC_F7     KC_F8     KC_F9     KC_F10   KC_F11    KC_F12    KC_BSPACE
  KC_PGDOWN KC_ESCAPE KC_1     KC_2        KC_3        KC_4      KC_5     KC_NO     KC_NO     KC_6      KC_7      KC_8      KC_9     KC_0      KC_EQUAL  KC_DELETE
            KC_TAB    KC_NO    KC_NO       KC_NO       KC_LPRN   KC_QUOTE KC_NO     KC_NO     KC_DOT    KC_4      KC_5      KC_6     KC_PLUS   KC_DELETE
  KC_LSFT   KC_RABK   KC_RCBR  KC_RBRACKET KC_RPRN     KC_DQUO   KC_NO    KC_NO     KC_NO     KC_0      KC_1      KC_2      KC_3     KC_SLASH  KC_COMMA  KC_RSFT
  RGB_MOD   KC_LALT                        KC_LCTL     LOWER_SPC KC_LALT            KC_RGUI   RAISE_ENT SPC_CTL                      RGB_HUI   RGB_SAI   GUI_JP
]

kbd.define_composite_key :SPC_CTL, %i(KC_SPACE KC_RCTL)

kbd.define_mode_key :RAISE_ENT, [ :KC_ENTER,             :raise, 500, 150 ]
kbd.define_mode_key :LOWER_SPC, [ :KC_SPACE,             :lower, 500, 150 ]
kbd.define_mode_key :RUBY,      [ Proc.new { kbd.ruby }, nil,    300, nil ]

kbd.define_mode_key :GUI_JP, [ :KC_LANG1, :KC_RSFT, 110, 150 ]


#################################################
#
# RGB Matrix (available in PRK Firmware 0.9.18+)
#
#################################################
# LED chain of the Amatelus73
#                           starts from here
#                           👇
# LED16 LED15 … <- … LED2  LED1  (right to left) num:16
#   |
# LED17 LED18 … -> … LED31 LED32 (left to right) num:16
#                            |
# LED47 LED46 … <- … LED34 LED33 (right to left) num:15
#   |
# LED48 LED49 … -> … LED62 LED63 (left to right) num:16
#                            |
# LED74 LED73 … <- … LED65 LED64 (right to left) num:11

# 16 * 5 => 80 which is 6 larger than 74
RGB_COL_COUNT = 16
RGB_ROW_COUNT = 5

# So we'll have to exclude six of them
# (Compare with the photo of the Amatelus73)
EXCLUDE_POS = [
  [0, 2],                                   # Exclude one LED position from the third row
  [2, 4], [3, 4], [4, 4], [11, 4], [12, 4]  # Exclude five LED positions from the fifth row
]

# A "right to left" row is "reversed"
ROW_REVERSED = [ true, false, true, false, true ]

def x_pos(col)
  224 / (RGB_COL_COUNT - 1) * col
end

def y_pos(row)
  64 / (RGB_ROW_COUNT - 1) * row
end

rgb_matrix = Array.new

RGB_ROW_COUNT.times do |row_index|
  RGB_COL_COUNT.times do |col|
    col_index = ROW_REVERSED[row_index] ? (RGB_COL_COUNT - col - 1) : col
    unless EXCLUDE_POS.include?([col_index, row_index])
      rgb_matrix << [x_pos(col_index), y_pos(row_index)]
    end
  end
end

rgb = RGB.new(0, 0, 74, false)
rgb.effect = :circle
rgb.speed = 22
rgb.plot_matrix(rgb_matrix)

kbd.append rgb

kbd.start!
