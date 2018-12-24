using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationAbility : BaseAbility
{
    public override void Initialize()
    {
        base.Initialize();
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
        GameObject go = new GameObject("AnimationAbility");
        go.transform.position = Vector3.zero;
        go.transform.parent = m_owner.Transform;
        var spriteRenderer = Common.GetOrAddComponent<SpriteRenderer>(go);
        var texture2d = Resources.Load<Texture2D>(spritePath);
        Sprite sprite = Sprite.Create(texture2d, new Rect(0, 0, texture2d.width, texture2d.height), new Vector2(0, 0));
        spriteRenderer.sprite = sprite;
    }
}
