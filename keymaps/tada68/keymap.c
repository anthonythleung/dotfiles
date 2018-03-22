#include "tada68.h"

// Each layer gets a name for readability, which is then used in the keymap matrix below.
// The underscores don't mean anything - you can have a layer called STUFF or any other name.
// Layer names don't all need to be of the same length, obviously, and you can also skip them
// entirely and just use numbers.
#define _BL 0
#define _WK 1
#define _FL 2
// #define LSHIFT KC_LSPO // Space cadet lshift
// #define RSHIFT KC_RSPC // Space cadet rshift
#define TAP_F TD(0)
#define TAP_J TD(1)
#define TAP_SLSH TD(2)
#define WIN TD(3)

qk_tap_dance_action_t tap_dance_actions[] = {
    [0]  = ACTION_TAP_DANCE_DOUBLE(KC_F, LSFT(KC_LBRC)),
    [1]  = ACTION_TAP_DANCE_DOUBLE(KC_J, LSFT(KC_RBRC)),
    [2]  = ACTION_TAP_DANCE_DOUBLE(KC_SLSH, KC_BSLS),
    [3]  = ACTION_TAP_DANCE_DOUBLE(KC_LGUI, KC_LCTL)
 };

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  /* Keymap _BL: (Base Layer) Default Layer
   * ,----------------------------------------------------------------.
   * |Esc | 1|  2|  3|  4|  5|  6|  7|  8|  9|  0|  -|  =|Backsp |~ ` |
   * |----------------------------------------------------------------|
   * |Tab  |  Q|  W|  E|  R|  T|  Y|  U|  I|  O|  P|  [|  ]|  \  |Del |
   * |----------------------------------------------------------------|
   * |Win    |  A|  S|  D|  F|  G|  H|  J|  K|  L|  ;|  '|Return |PgUp|
   * |----------------------------------------------------------------|
   * |Shift   |  Z|  X|  C|  V|  B|  N|  M|  ,|  .|  /|Backsp| Up|PgDn|
   * |----------------------------------------------------------------|
   * |Fn  |Ctrl|Alt |        Space          |Alt| FN|Ctrl|Lef|Dow|Rig |
   * `----------------------------------------------------------------'
   */
[_BL] = KEYMAP_ANSI(
  KC_ESC,    KC_1,   KC_2,   KC_3,   KC_4,   KC_5,   KC_6,   KC_7,   KC_8,   KC_9,   KC_0,   KC_MINS, KC_EQL, KC_BSPC,KC_GRV, \
  KC_TAB,  KC_Q,   KC_W,   KC_E,   KC_R,   KC_T,   KC_Y,   KC_U,   KC_I,   KC_O,   KC_P,   KC_LBRC, KC_RBRC,KC_BSLS,KC_DEL, \
  KC_LGUI, KC_A,   KC_S,   KC_D,   KC_F,   KC_G,   KC_H,  KC_J,   KC_K,   KC_L,   KC_SCLN,KC_QUOT,         KC_ENT,KC_PGUP,  \
  KC_LSFT,         KC_Z,   KC_X,   KC_C,   KC_V,   KC_B,   KC_N,   KC_M,   KC_COMM,KC_DOT, KC_SLSH,   KC_BSPC,KC_UP,KC_PGDN, \
  MO(_FL), KC_LCTL,KC_LALT,                KC_SPC,                        KC_RALT,MO(_FL),KC_RCTRL, KC_LEFT,KC_DOWN,KC_RGHT),


  /* Keymap _WK: (Base Layer) Work Layer
   * ,----------------------------------------------------------------.
   * |Esc | 1|  2|  3|  4|  5|  6|  7|  8|  9|  0|  -|  =|Backsp |~ ` |
   * |----------------------------------------------------------------|
   * |Tab  |  Q|  W|  E|  R|  T|  Y|  U|  I|  O|  P|  [|  ]|  \  |Del |
   * |----------------------------------------------------------------|
   * |Ctrl   |  A|  S|  D|  F|  G|  H|  J|  K|  L|  ;|  '|Return |PgUp|
   * |----------------------------------------------------------------|
   * |Shift   |  Z|  X|  C|  V|  B|  N|  M|  ,|  .|  /|Backsp| Up|PgDn|
   * |----------------------------------------------------------------|
   * |Fn  |Win |Alt |        Space          |Alt| FN|Ctrl|Lef|Dow|Rig |
   * `----------------------------------------------------------------'
   */

 [_WK] = KEYMAP_ANSI(
  KC_ESC,    KC_1,   KC_2,   KC_3,   KC_4,   KC_5,   KC_6,   KC_7,   KC_8,   KC_9,   KC_0,   KC_MINS, KC_EQL, KC_BSPC,KC_GRV, \
  KC_TAB,  KC_Q,   KC_W,   KC_E,   KC_R,   KC_T,   KC_Y,   KC_U,   KC_I,   KC_O,   KC_P,   KC_LBRC, KC_RBRC,KC_BSLS,KC_DEL, \
  KC_LCTL, KC_A,   KC_S,   KC_D,   KC_F,   KC_G,   KC_H,  KC_J,   KC_K,   KC_L,   KC_SCLN,KC_QUOT,         KC_ENT,KC_PGUP,  \
  KC_LSFT,         KC_Z,   KC_X,   KC_C,   KC_V,   KC_B,   KC_N,   KC_M,   KC_COMM,KC_DOT, KC_SLSH,   KC_BSPC,KC_UP,KC_PGDN, \
  MO(_FL), KC_LGUI,KC_LALT,                KC_SPC,                        KC_RALT,MO(_FL),KC_RCTRL, KC_LEFT,KC_DOWN,KC_RGHT),

  /* Keymap _FL: Function Layer
   * ,----------------------------------------------------------------.
   * |SLP| F1|F2 |F3 |F4 |F5 |F6 |F7 |F8 |F9 |F10|F11|F12|Del    |Ins |
   * |----------------------------------------------------------------|
   * |     |   |   |   |   |   |   |   |   |   |   |   |   |     |    |
   * |----------------------------------------------------------------|
   * |      |VL-|MUT|VL+|   |   |<- |UP |DWN|-> |   |   |        |Hme |
   * |----------------------------------------------------------------|
   * |        |NOR|WK |Bl-|BL |BL+|   |   |   |   |\  |RShift|   |End |
   * |----------------------------------------------------------------|
   * |    |    |    |        Backsp         |   |   |    |Pre|Ply|Nex |
   * `----------------------------------------------------------------'
   */
[_FL] = KEYMAP_ANSI(
  KC_SYSTEM_SLEEP, KC_F1 , KC_F2 , KC_F3 , KC_F4 , KC_F5 , KC_F6 , KC_F7 , KC_F8 , KC_F9 , KC_F10, KC_F11, KC_F12, KC_DEL, KC_INS ,  \
  KC_TRNS,KC_TRNS,KC_TRNS,KC_TRNS,KC_TRNS,KC_TRNS,KC_TRNS,KC_TRNS,KC_TRNS,KC_TRNS,KC_TRNS,KC_TRNS,KC_TRNS,KC_TRNS,KC_TRNS, \
  KC_TRNS,KC_VOLD,KC_MUTE,KC_VOLU,KC_TRNS,KC_TRNS,KC_LEFT,KC_DOWN,KC_UP  ,KC_RGHT,KC_TRNS,KC_TRNS,        KC_TRNS,KC_HOME, \
  KC_TRNS,TO(_BL),TO(_WK),BL_DEC ,BL_TOGG,BL_INC ,KC_TRNS,KC_TRNS,KC_TRNS,KC_TRNS,KC_BSLS,KC_RSFT, KC_TRNS, KC_END, \
  MO(_FL),KC_TRNS,KC_TRNS,                 KC_BSPC,               KC_TRNS,KC_TRNS,KC_TRNS,KC_MRWD,KC_MPLY, KC_MFFD),

};
