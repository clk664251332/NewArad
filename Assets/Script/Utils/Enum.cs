using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum EActionState
{
    None,
    Idle,
    Walk,
    Run,
    Jump,
    Attack,
    RunAttack,//冲刺斩
    JumpAttack,//跳斩
    Skill,
    Behit,
    HitDown,//倒地
    BeatFly,//击飞
    Floating,//浮空
    Stun,//麻痹
    Die,//死亡
}
