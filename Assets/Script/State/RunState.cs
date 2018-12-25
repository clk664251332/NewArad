using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RunState : BaseMovementState
{
    public RunState(Actor actor) : base(actor, EActionState.Run)
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
