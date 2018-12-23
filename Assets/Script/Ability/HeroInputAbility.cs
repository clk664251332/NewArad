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

    public override void Initialize()
    {
        base.Initialize();
        m_fLastArrowKeyDownTime = -1f;
        m_fLastArrowKeyUpTime = -1f;
    }

    public override void Update()
    {
        base.Update();
        if ((m_owner is Hero) == false)
            return;

        InputLogic();
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

    private void InputLogic()
    {
        if (GetKeyDown(KeyCode.LeftArrow))
        {
            Debug.Log("Press: Left");
        }
        else if (GetKeyDown(KeyCode.RightArrow))
        {
            Debug.Log("Press: Right");
        }
        else if (GetKeyDown(KeyCode.UpArrow))
        {
            Debug.Log("Press: Up");
        }
        else if (GetKeyDown(KeyCode.DownArrow))
        {
            Debug.Log("Press: Down");
        }

        if (GetKeyUp(KeyCode.LeftArrow))
        {
            Debug.Log("Release: Left");
        }
        else if (GetKeyUp(KeyCode.RightArrow))
        {
            Debug.Log("Release: Right");
        }
        else if (GetKeyUp(KeyCode.UpArrow))
        {
            Debug.Log("Release: Up");
        }
        else if (GetKeyUp(KeyCode.DownArrow))
        {
            Debug.Log("Release: Down");
        }
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
