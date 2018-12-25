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
    }

    public void CreatSprite(string spritePath)
    {
        var texture2d = Resources.Load<Texture2D>(spritePath);
        Sprite sprite = Sprite.Create(texture2d, new Rect(0, 0, texture2d.width, texture2d.height), new Vector2(0, 0));
        m_spriteRenderer.sprite = sprite;
    }
}
