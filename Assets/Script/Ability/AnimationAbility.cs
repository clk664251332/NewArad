using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationAbility : BaseAbility
{
    private SpriteRenderer m_spriteRenderer;

    public SpriteRenderer GetSpriteRenderer()
    {
        return m_spriteRenderer;
    }

    public override void Initialize()
    {
        base.Initialize();
        GameObject go = new GameObject("AnimationAbility");
        go.transform.position = Vector3.zero;
        go.transform.parent = m_owner.Transform;
        m_spriteRenderer = Common.GetOrAddComponent<SpriteRenderer>(go);
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

    public void CreatSprite(string spritePath)
    {
        var texture2d = Resources.Load<Texture2D>(spritePath);
        //精灵的Pivot在中间为（0.5，0.5）
        Sprite sprite = Sprite.Create(texture2d, new Rect(0, 0, texture2d.width, texture2d.height), new Vector2(0.58f, 0f));
        m_spriteRenderer.sprite = sprite;
    }

    private void SetSpriteFlip()
    {
        if (m_owner.Direction == 1)
            m_spriteRenderer.flipX = false;
        else
            m_spriteRenderer.flipX = true;
    }
}
