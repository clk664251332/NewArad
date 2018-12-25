using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IdleState : BaseMovementState
{
    public IdleState(Actor actor) : base(actor, EActionState.Idle)
    {

    }

    public override void EnterState(EActionState eState)
    {
        base.EnterState(eState);
        Debug.Log("Enter Idle");
    }

    public override void BreakState(EActionState eState)
    {
        base.BreakState(eState);
        Debug.Log("Exit Idle");
    }

    public override void OnUpdate()
    {
        base.OnUpdate();
    }
}
