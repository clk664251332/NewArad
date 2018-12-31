using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Attack1State : BaseBattleState
{
    public Attack1State(Actor actor) : base(actor, EActionState.Attack1)
    {
    }

    public override void EnterState(EActionState eState)
    {
        base.EnterState(eState);
    }

    public override void BreakState(EActionState eState)
    {
        base.BreakState(eState);
    }

    public override void OnUpdate()
    {
        base.OnUpdate();
    }
}
