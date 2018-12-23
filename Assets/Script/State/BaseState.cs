using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//状态分类：站立/走/跑/跳/技能
//有些技能状态可以被其他动作强制打断
public class BaseState
{
    public virtual void OnEnter()
    {

    }

    public virtual void OnUpdate()
    {

    }

    public virtual void OnExit()
    {

    }
}
