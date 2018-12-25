using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HeroInputAbility : BaseAbility
{
    private const float ClickDeltaTime = 0.5f;

    private KeyCode m_lastArrowKeyDownCode;
    private KeyCode m_lastArrowKeyUpCode;

    private float m_fLastArrowKeyDownTime;
    private float m_fLastArrowKeyUpTime;

    private Rigidbody2D m_rig2d;
    private SpriteRenderer m_spriteRenderer;
    private Vector2 m_velocity = Vector2.zero;
    private float m_speed = 1.0f;

    public override void Initialize()
    {
        base.Initialize();
        m_fLastArrowKeyDownTime = -1f;
        m_fLastArrowKeyUpTime = -1f;

        var gameObject = m_owner.GetObject();
        if (gameObject == null) return;

        m_rig2d = Common.GetOrAddComponent<Rigidbody2D>(gameObject);
        m_rig2d.gravityScale = 0;
        m_rig2d.bodyType = RigidbodyType2D.Kinematic;      
    }

    public override void GetComponent()
    {
        base.GetComponent();
        m_spriteRenderer = m_owner.GetAbility<AnimationAbility>().GetSpriteRenderer();
    }

    public override void Update()
    {
        base.Update();
        if ((m_owner is Hero) == false)
            return;

        //InputLogic();
        if (m_rig2d != null)
            m_rig2d.velocity = m_velocity;
    }

    private bool GetKeyDown(KeyCode keyCode)
    {
        if (Input.GetKeyDown(keyCode))
        {
            if (CheckIsArrowKey(keyCode))
            {
                m_lastArrowKeyDownCode = keyCode;
                m_fLastArrowKeyDownTime = Time.time;
                CheckDoubleClick();
            }
            return true;
        }
        
        return false;
    }

    private bool GetKeyUp(KeyCode keyCode)
    {
        if (Input.GetKeyUp(keyCode))
        {
            if (CheckIsArrowKey(keyCode))
            {
                m_lastArrowKeyUpCode = keyCode;
                m_fLastArrowKeyUpTime = Time.time;
            }
            return true;
        }

        return false;  
    }

    public void InputLogic()
    {
        float h = Input.GetAxisRaw("Horizontal");
        float v = Input.GetAxisRaw("Vertical");

        m_rig2d.velocity = new Vector2(h * m_speed, v * m_speed);
        m_spriteRenderer.flipX = h < 0;
    }

    private void CheckDoubleClick()
    {
        if (m_fLastArrowKeyDownTime == -1 || m_fLastArrowKeyUpTime == -1)
            return;

        if (m_lastArrowKeyDownCode == m_lastArrowKeyUpCode)
        {
            if (m_fLastArrowKeyDownTime - m_fLastArrowKeyUpTime < ClickDeltaTime)
            {
                Debug.Log("Double Click!");
            }           
        }
    }

    private bool CheckIsArrowKey(KeyCode keyCode)
    {
        if (keyCode == KeyCode.LeftArrow || keyCode == KeyCode.RightArrow || keyCode == KeyCode.UpArrow || keyCode == KeyCode.DownArrow)
            return true;
        else
            return false;
    }
}
