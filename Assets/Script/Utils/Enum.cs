using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum EActionState
{
    None,
    Idle,
    Walk,
    Run,
    Jump_Prepare,
    Jump_Up,
    Jump_Fall,
    Jump_Down,
    Attack1,
    Attack2,
    Attack3,
    Attack4,
    RunAttack,//冲刺斩
    JumpAttack,//跳斩
    Skill1,
    Skill2,
    Skill3,
    Skill4,
    Skill5,
    Skill6,
    Skill7,
    Skill8,
    Skill9,
    Behit,
    HitDown,//倒地
    BeatFly,//击飞
    Floating,//浮空
    Stun,//麻痹
    Die,//死亡
}
