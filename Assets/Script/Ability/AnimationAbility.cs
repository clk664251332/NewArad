using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationAbility : BaseAbility
{
    private tk2dSprite m_tk2dSprite;
    private tk2dSpriteAnimator m_tk2dSpriteAnimator;

    public tk2dSprite GetTk2dSprite()
    {
        return m_tk2dSprite;
    }

    public tk2dSpriteAnimator GetTk2dSpriteAnimator()
    {
        return m_tk2dSpriteAnimator;
    }

    public override void Initialize()
    {
        base.Initialize();

        GameObject loadGameObject = Resources.Load<GameObject>("Prefab/PayerAnimator");
        if (loadGameObject == null)
        {
            Debug.LogError("未找到资源!");
            return;
        }
        var go = GameObject.Instantiate<GameObject>(loadGameObject);
        go.transform.position = Vector3.zero;
        go.transform.parent = m_owner.Transform;
        go.name = "AnimationAbility";

        m_tk2dSprite = go.GetComponent<tk2dSprite>();
        m_tk2dSpriteAnimator = go.GetComponent<tk2dSpriteAnimator>();
        //要从配置中获得装扮配置，m_tk2dSpriteAnimator图集为skin
        //创建子物体添加sprite组件,显示为其他部件
    }

    public override void GetComponent()
    {
        base.GetComponent();
    }

    public override void Release()
    {
        base.Release();
    }

    public override void Update()
    {
        base.Update();
        SetSpriteFlip();
    }

    private void SetSpriteFlip()
    {
        if (m_owner.Direction == 1)
            m_tk2dSprite.FlipX = false;
        else
            m_tk2dSprite.FlipX = true;
    }
}
