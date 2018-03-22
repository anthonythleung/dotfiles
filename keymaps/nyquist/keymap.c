#include "nyquist.h"
#include "action_layer.h"
#include "eeconfig.h"

extern keymap_config_t keymap_config;

// Each layer gets a name for readability, which is then used in the keymap matrix below.
// The underscores don't mean anything - you can have a layer called STUFF or any other name.
// Layer names don't all need to be of the same length, obviously, and you can also skip them
// entirely and just use numbers.
#define _QWERTY 0
#define _LOWER 1
#define _RAISE 2
#define _FN 3

enum custom_keycodes {
  QWERTY = SAFE_RANGE,
  LOWER,
  RAISE,
  FN,
  RED,
  GREEN,
  BLUE,
  PURPLE,
  TEAL,
  YELLOW 
};

const uint8_t RGBLED_RAINBOW_SWIRL_INTERVALS[] PROGMEM = {20, 10, 5};

// Fillers to make layering more clear
#define _______ KC_TRNS
#define XXXXXXX KC_NO

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

/* Qwerty
 * ,-----------------------------------------------------------------------------------.
 * |   `  |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  | Del  |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Tab  |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  | Bspc |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Ctrl |   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   ;  |  '   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Shift|   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   /  |Enter |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |  Fn  | Ctrl | GUI  | Alt  |Lower |Space |Space |Raise | Left | Down |  Up  |Right |
 * `-----------------------------------------------------------------------------------'
 */
[_QWERTY] = KEYMAP( \
  KC_GESC, KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_DEL,  \
  KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_BSPC, \
  KC_LCTL, KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT, \
  KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_ENT,  \
  FN,      KC_LCTL, KC_LGUI, KC_LALT, LOWER,   KC_SPACE,KC_SPACE,RAISE,   KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT  \
),

/* Raise 
 * ,-----------------------------------------------------------------------------------.
 * |   `  |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |  F7  |  F8  |  F9  | F10  | Bksp |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |  Tab |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  |  \   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | CAPS |   <  |   >  |  {   |   [  |   `  |   |  |  ]   |   }  |   -  |   =  |      |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Shift|   <  |   >  |  {   |   [  |   `  |   |  |  ]   |   }  |   -  |   =  |Enter |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |  Fn  | Ctrl | GUI  | Alt  |Lower |Space | Space| Raise| Left | Down |  Up  | Right|
 * `-----------------------------------------------------------------------------------'
 */
[_RAISE] = KEYMAP( \
  KC_GESC, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_BSPC, \
  KC_TAB,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_BSLS, \
  KC_CAPS, KC_LT,   KC_GT,   KC_LCBR, KC_LBRC, KC_GRV,  KC_PIPE, KC_RBRC, KC_RCBR, KC_MINS, KC_EQL,  XXXXXXX, \
  KC_LSFT, KC_LT,   KC_GT,   KC_LCBR, KC_LBRC, KC_GRV,  KC_PIPE, KC_RBRC, KC_RCBR, KC_MINS, KC_EQL,  KC_ENT,  \
  XXXXXXX, KC_LCTL, KC_LGUI, KC_LALT, LOWER,   KC_SPC,  KC_SPC,  RAISE,   KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT  \
),

/* Lower 
 * ---------------------------------------------------------------------------------.
 * |   `  |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |  F7  |  F8  |  F9  | F10  | Bksp |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Tab  | PgU  |      |  Up  |      | Home |      |LClick|RClick|      |      |  \   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | CAPS | PgD  | Left | Down | Right| End  |  MsL | MsDn | MsUp | MsR  |      |      |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Shift|      |      |      |      |      |Sens 0|Sens 1|Sens 2|      |      |Enter |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |  Fn  | Ctrl | GUI  | Alt  |Lower |Space |   0  | Raise| Left | Down |  Up  | Right|
 * `-----------------------------------------------------------------------------------'
 */
[_LOWER] = KEYMAP( \
  KC_GESC, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_BSPC, \
  KC_TAB,  KC_PGUP, XXXXXXX, KC_UP,   XXXXXXX, KC_HOME, XXXXXXX, KC_BTN1, KC_BTN2, XXXXXXX, XXXXXXX, KC_BSLS, \
  KC_CAPS, KC_PGDN, KC_LEFT, KC_DOWN, KC_RGHT, KC_END,  KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, XXXXXXX, XXXXXXX, \
  KC_LSFT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_ACL0, KC_ACL1, KC_ACL2, XXXXXXX, XXXXXXX, XXXXXXX, KC_ENT,  \
  XXXXXXX, KC_LCTL, KC_LGUI, KC_LALT, LOWER,   KC_SPC,  KC_0,    RAISE,   KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT  \
),

/* FN
 * ,-----------------------------------------------------------------------------------.
 * |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |  F7  |  F8  |  F9  |  F10 |  F11 |  F12 |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      | Vol- | Mute | Vol+ | RED  |GREEN |Hue Up|Hue Dn|Sat Up|Sat Dn|      | LOCK |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      | Prev | Play | Next | BLUE |PURPLE|RGB Tg|RGB Md|Val Up|Val Dn|      | PRTN |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      |      |      |      | TEAL |YELLOW|      |      |      |      |      |      |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |  FN  |      |RGB SW|RGB SN|RGB KN|RGB XM|RGB PL|RGB RB|RGB BR|RGB GR|      |RESET |
 * `-----------------------------------------------------------------------------------'
 */
[_FN] =  KEYMAP( \
  KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  \
  XXXXXXX, KC_VOLD, KC_MUTE, KC_VOLU, RED,     GREEN,   RGB_HUD, RGB_HUI, RGB_SAD, RGB_SAI, XXXXXXX, XXXXXXX, \
  XXXXXXX, KC_MRWD, KC_MPLY, KC_MFFD, BLUE,    PURPLE,  RGB_TOG, RGB_MOD, RGB_VAI, RGB_VAD, XXXXXXX, KC_PSCR, \
  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, TEAL,    YELLOW,  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, \
  FN,      XXXXXXX, RGB_M_SW,RGB_M_SN,RGB_M_K, RGB_M_X, RGB_M_P, RGB_M_R, RGB_M_B, RGB_M_G, XXXXXXX, RESET    \
)

};

#ifdef AUDIO_ENABLE
float tone_qwerty[][2]     = SONG(QWERTY_SOUND);
#endif

void persistent_default_layer_set(uint16_t default_layer) {
  eeconfig_update_default_layer(default_layer);
  default_layer_set(default_layer);
}

#define rgblight_set_blue        rgblight_sethsv (0xFF,  0xFF, 0xFF);
#define rgblight_set_red         rgblight_sethsv (0x00,  0xFF, 0xFF);
#define rgblight_set_green       rgblight_sethsv (0x78,  0xFF, 0xFF);
#define rgblight_set_orange      rgblight_sethsv (0x1E,  0xFF, 0xFF);
#define rgblight_set_teal        rgblight_sethsv (0xC3,  0xFF, 0xFF);
#define rgblight_set_magenta     rgblight_sethsv (0x12C, 0xFF, 0xFF);
#define rgblight_set_yellow      rgblight_sethsv (0x3C,  0xFF, 0xFF);
#define rgblight_set_purple      rgblight_sethsv (0x10E, 0xFF, 0xFF);
#define rgblight_set_white       rgblight_sethsv (0x00,  0x00, 0xFF);
#define rgblight_set_black       rgblight_sethsv (0x00,  0x00, 0x00);

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case QWERTY:
      if (record->event.pressed) {
        #ifdef AUDIO_ENABLE
          PLAY_SONG(tone_qwerty);
        #endif
        persistent_default_layer_set(1UL<<_QWERTY);
      }
      return false;
      break;
    case LOWER:
      if (record->event.pressed) {
        layer_on(_LOWER);
        update_tri_layer(_LOWER, _RAISE, _FN);
      } else {
        layer_off(_LOWER);
        update_tri_layer(_LOWER, _RAISE, _FN);
      }
      return false;
      break;
    case RAISE:
      if (record->event.pressed) {
        layer_on(_RAISE);
        update_tri_layer(_LOWER, _RAISE, _FN);
      } else {
        layer_off(_RAISE);
        update_tri_layer(_LOWER, _RAISE, _FN);
      }
      return false;
      break;
    case FN:
      if (record->event.pressed) {
        layer_on(_FN);
      } else {
        layer_off(_FN);
      }
      return false;
      break;

    case RED:
      rgblight_set_red
      break;
    case GREEN:
      rgblight_set_green
      break;
    case BLUE:
      rgblight_set_blue
      break;
    case PURPLE:
      rgblight_set_magenta 
      break;
    case TEAL:
      rgblight_set_teal
      break;
    case YELLOW:
      rgblight_set_yellow
      break;
  }
  return true;
}
