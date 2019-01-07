using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Game.Config;

public class AnimationAbility : BaseAbility
{
    private tk2dSprite m_skinSprite;
    private tk2dSpriteAnimator m_tk2dSpriteAnimator;
    public Transform m_animationTrans;

    private List<tk2dSprite> m_lstPartSprite = new List<tk2dSprite>();
    public tk2dSprite GetTk2dSprite()
    {
        return m_skinSprite;
    }

    public tk2dSpriteAnimator GetTk2dSpriteAnimator()
    {
        return m_tk2dSpriteAnimator;
    }

    public override void Initialize()
    {
        base.Initialize();

        var playerData = ConfigManager.Instance.GetData<ProfessionLoader, ProfessionLoader.Data>(m_owner.Id);
        string animatorName = playerData.AnimatorName;

        GameObject loadGameObject = Resources.Load<GameObject>("Animator/" + animatorName);
        if (loadGameObject == null)
        {
            Debug.LogError("未找到资源!");
            return;
        }
        var go = GameObject.Instantiate<GameObject>(loadGameObject);
        go.transform.position = Vector3.zero;
        go.transform.parent = m_owner.Transform;
        go.name = "AnimationAbility";
        m_animationTrans = go.transform;

        m_skinSprite = go.GetComponent<tk2dSprite>();
        m_tk2dSpriteAnimator = go.GetComponent<tk2dSpriteAnimator>();

        var fashionData = ConfigManager.Instance.GetData<FashionLoader, FashionLoader.Data>(m_owner.FashionConfigId);
        InitPart(fashionData, go.transform);
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
        UpdatePartSprite();
    }

    private void SetSpriteFlip()
    {
        if (m_owner.Direction == 1)
        {
            for(int i=0;i< m_lstPartSprite.Count; i++)
            {
                m_lstPartSprite[i].FlipX = false;
            }
        }
        else
        {
            for (int i = 0; i < m_lstPartSprite.Count; i++)
            {
                m_lstPartSprite[i].FlipX = true;
            }
        }
    }
    /// <summary>
    /// 排序skin-0/coat-1/chest-2//hair-5/cap-6/pant-7/shoes-8/belt-9/weaponPart1-3/weaponPart2-4
    /// </summary>
    /// <param name="fashionData"></param>
    /// <param name="rootTrans"></param>
    private void InitPart(FashionLoader.Data fashionData, Transform rootTrans)
    {
        if (fashionData.Skin != 0)
        {
            var partData = ConfigManager.Instance.GetData<PartLoader, PartLoader.Data>(fashionData.Skin);

            GameObject skinObj = new GameObject("Skin");
            skinObj.transform.parent = rootTrans;

            var skinSprite = Common.GetOrAddComponent<tk2dSprite>(skinObj);
            tk2dSpriteCollectionData tk2DSpriteCollectionData = tk2dSystem.LoadResourceByName<tk2dSpriteCollectionData>(partData.CollectionName);
            skinSprite.SetSprite(tk2DSpriteCollectionData, 0);
            //skinSprite.SortingOrder = 0;
            skinSprite.SortingLevel = 0;

            m_lstPartSprite.Add(skinSprite);
        }

        if (fashionData.Coat_1 != 0)
        {
            var partData = ConfigManager.Instance.GetData<PartLoader, PartLoader.Data>(fashionData.Coat_1);

            GameObject coat_1Obj = new GameObject("Coat1");
            coat_1Obj.transform.parent = rootTrans;

            var coat_1Sprite = Common.GetOrAddComponent<tk2dSprite>(coat_1Obj);
            tk2dSpriteCollectionData tk2DSpriteCollectionData = tk2dSystem.LoadResourceByName<tk2dSpriteCollectionData>(partData.CollectionName);
            coat_1Sprite.SetSprite(tk2DSpriteCollectionData, 0);
            //coat_1Sprite.SortingOrder = 1;
            coat_1Sprite.SortingLevel = 1;

            m_lstPartSprite.Add(coat_1Sprite);
        }

        if (fashionData.Coat_2 != 0)
        {
            var partData = ConfigManager.Instance.GetData<PartLoader, PartLoader.Data>(fashionData.Coat_2);

            GameObject coat_2Obj = new GameObject("Coat2");
            coat_2Obj.transform.parent = rootTrans;

            var coat_2Sprite = Common.GetOrAddComponent<tk2dSprite>(coat_2Obj);
            tk2dSpriteCollectionData tk2DSpriteCollectionData = tk2dSystem.LoadResourceByName<tk2dSpriteCollectionData>(partData.CollectionName);
            coat_2Sprite.SetSprite(tk2DSpriteCollectionData, 0);
            //coat_2Sprite.SortingOrder = 1;
            coat_2Sprite.SortingLevel = 1;

            m_lstPartSprite.Add(coat_2Sprite);
        }

        if (fashionData.Chest != 0)
        {
            var partData = ConfigManager.Instance.GetData<PartLoader, PartLoader.Data>(fashionData.Chest);

            GameObject chestObj = new GameObject("Chest");
            chestObj.transform.parent = rootTrans;

            var chestSprite = Common.GetOrAddComponent<tk2dSprite>(chestObj);
            tk2dSpriteCollectionData tk2DSpriteCollectionData = tk2dSystem.LoadResourceByName<tk2dSpriteCollectionData>(partData.CollectionName);
            chestSprite.SetSprite(tk2DSpriteCollectionData, 0);
            //chestSprite.SortingOrder = 2;
            chestSprite.SortingLevel = 1;

            m_lstPartSprite.Add(chestSprite);
        }

        if (fashionData.Hair != 0)
        {
            var partData = ConfigManager.Instance.GetData<PartLoader, PartLoader.Data>(fashionData.Hair);

            GameObject hairObj = new GameObject("Hair");
            hairObj.transform.parent = rootTrans;

            var hairSprite = Common.GetOrAddComponent<tk2dSprite>(hairObj);
            tk2dSpriteCollectionData tk2DSpriteCollectionData = tk2dSystem.LoadResourceByName<tk2dSpriteCollectionData>(partData.CollectionName);
            hairSprite.SetSprite(tk2DSpriteCollectionData, 0);
            //hairSprite.SortingOrder = 3;
            hairSprite.SortingLevel = 1;

            m_lstPartSprite.Add(hairSprite);
        }

        if (fashionData.Cap != 0)
        {
            var partData = ConfigManager.Instance.GetData<PartLoader, PartLoader.Data>(fashionData.Cap);

            GameObject capObj = new GameObject("Cap");
            capObj.transform.parent = rootTrans;

            var capSprite = Common.GetOrAddComponent<tk2dSprite>(capObj);
            tk2dSpriteCollectionData tk2DSpriteCollectionData = tk2dSystem.LoadResourceByName<tk2dSpriteCollectionData>(partData.CollectionName);
            capSprite.SetSprite(tk2DSpriteCollectionData, 0);
            //capSprite.SortingOrder = 4;
            capSprite.SortingLevel = 2;

            m_lstPartSprite.Add(capSprite);
        }

        if (fashionData.Pants_1 != 0)
        {
            var partData = ConfigManager.Instance.GetData<PartLoader, PartLoader.Data>(fashionData.Pants_1);

            GameObject pant_1Obj = new GameObject("Pants_1");
            pant_1Obj.transform.parent = rootTrans;

            var pant_1Sprite = Common.GetOrAddComponent<tk2dSprite>(pant_1Obj);
            tk2dSpriteCollectionData tk2DSpriteCollectionData = tk2dSystem.LoadResourceByName<tk2dSpriteCollectionData>(partData.CollectionName);
            pant_1Sprite.SetSprite(tk2DSpriteCollectionData, 0);
            //pant_1Sprite.SortingOrder = 5;
            pant_1Sprite.SortingLevel = 1;

            m_lstPartSprite.Add(pant_1Sprite);
        }

        if (fashionData.Pants_2 != 0)
        {
            var partData = ConfigManager.Instance.GetData<PartLoader, PartLoader.Data>(fashionData.Pants_2);

            GameObject pant_2Obj = new GameObject("Pants_2");
            pant_2Obj.transform.parent = rootTrans;

            var pant_2Sprite = Common.GetOrAddComponent<tk2dSprite>(pant_2Obj);
            tk2dSpriteCollectionData tk2DSpriteCollectionData = tk2dSystem.LoadResourceByName<tk2dSpriteCollectionData>(partData.CollectionName);
            pant_2Sprite.SetSprite(tk2DSpriteCollectionData, 0);
            //pant_2Sprite.SortingOrder = 5;
            pant_2Sprite.SortingLevel = 1;

            m_lstPartSprite.Add(pant_2Sprite);
        }

        if (fashionData.Shoes_1 != 0)
        {
            var partData = ConfigManager.Instance.GetData<PartLoader, PartLoader.Data>(fashionData.Shoes_1);

            GameObject shoes_1Obj = new GameObject("Shoes_1");
            shoes_1Obj.transform.parent = rootTrans;

            var shoes_1Sprite = Common.GetOrAddComponent<tk2dSprite>(shoes_1Obj);
            tk2dSpriteCollectionData tk2DSpriteCollectionData = tk2dSystem.LoadResourceByName<tk2dSpriteCollectionData>(partData.CollectionName);
            shoes_1Sprite.SetSprite(tk2DSpriteCollectionData, 0);
            //shoes_1Sprite.SortingOrder = 6;
            shoes_1Sprite.SortingLevel = 1;

            m_lstPartSprite.Add(shoes_1Sprite);
        }

        if (fashionData.Shoes_2 != 0)
        {
            var partData = ConfigManager.Instance.GetData<PartLoader, PartLoader.Data>(fashionData.Shoes_2);

            GameObject shoes_2Obj = new GameObject("Shoes_2");
            shoes_2Obj.transform.parent = rootTrans;

            var shoes_2Sprite = Common.GetOrAddComponent<tk2dSprite>(shoes_2Obj);
            tk2dSpriteCollectionData tk2DSpriteCollectionData = tk2dSystem.LoadResourceByName<tk2dSpriteCollectionData>(partData.CollectionName);
            shoes_2Sprite.SetSprite(tk2DSpriteCollectionData, 0);
            //shoes_2Sprite.SortingOrder = 6;
            shoes_2Sprite.SortingLevel = 1;

            m_lstPartSprite.Add(shoes_2Sprite);
        }

        if (fashionData.Belt != 0)
        {
            var partData = ConfigManager.Instance.GetData<PartLoader, PartLoader.Data>(fashionData.Belt);

            GameObject beltObj = new GameObject("Belt");
            beltObj.transform.parent = rootTrans;

            var beltSprite = Common.GetOrAddComponent<tk2dSprite>(beltObj);
            tk2dSpriteCollectionData tk2DSpriteCollectionData = tk2dSystem.LoadResourceByName<tk2dSpriteCollectionData>(partData.CollectionName);
            beltSprite.SetSprite(tk2DSpriteCollectionData, 0);
            //beltSprite.SortingOrder = 7;
            beltSprite.SortingLevel = 2;

            m_lstPartSprite.Add(beltSprite);
        }

        if (fashionData.Weapon_1 != 0)
        {
            var partData = ConfigManager.Instance.GetData<PartLoader, PartLoader.Data>(fashionData.Weapon_1);

            GameObject weapon_1Obj = new GameObject("Weapon_1");
            weapon_1Obj.transform.parent = rootTrans;

            var weapon_1Sprite = Common.GetOrAddComponent<tk2dSprite>(weapon_1Obj);
            tk2dSpriteCollectionData tk2DSpriteCollectionData = tk2dSystem.LoadResourceByName<tk2dSpriteCollectionData>(partData.CollectionName);
            weapon_1Sprite.SetSprite(tk2DSpriteCollectionData, 0);
            //weapon_1Sprite.SortingOrder = 8;
            weapon_1Sprite.SortingLevel = 2;

            m_lstPartSprite.Add(weapon_1Sprite);
        }

        if (fashionData.Weapon_2 != 0)
        {
            var partData = ConfigManager.Instance.GetData<PartLoader, PartLoader.Data>(fashionData.Weapon_2);

            GameObject weapon_2Obj = new GameObject("Weapon_2");
            weapon_2Obj.transform.parent = rootTrans;

            var weapon_2Sprite = Common.GetOrAddComponent<tk2dSprite>(weapon_2Obj);
            tk2dSpriteCollectionData tk2DSpriteCollectionData = tk2dSystem.LoadResourceByName<tk2dSpriteCollectionData>(partData.CollectionName);
            weapon_2Sprite.SetSprite(tk2DSpriteCollectionData, 0);
            //weapon_2Sprite.SortingOrder = 8;
            weapon_2Sprite.SortingLevel = 2;

            m_lstPartSprite.Add(weapon_2Sprite);
        }
    }
    private void UpdatePartSprite()
    {
        for (int i = 0; i < m_lstPartSprite.Count; i++)
        {
            m_lstPartSprite[i].SetSprite(m_skinSprite.spriteId);
            m_lstPartSprite[i].SortingOrder = 600 - (int)m_owner.Transform.position.y + m_lstPartSprite[i].SortingLevel;
        }
    }
}
