package ch.ivyteam.ivy.cluster;

/**
 */
@SuppressWarnings("all")
@javax.annotation.Generated(comments="This is the java file of the ivy data class PerformanceTest", value={"ch.ivyteam.ivy.scripting.streamInOut.IvyScriptJavaClassBuilder"})
public class PerformanceTest extends ch.ivyteam.ivy.scripting.objects.CompositeObject
{
  /** SerialVersionUID */
  private static final long serialVersionUID = 2080488707927765360L;

  /**
   * True, if the process should repeated (after the delay)
   */
  private ch.ivyteam.ivy.cluster.CreateData craete;

  /**
   * Gets the field craete.
   * @return the value of the field craete; may be null.
   */
  public ch.ivyteam.ivy.cluster.CreateData getCraete()
  {
    return craete;
  }

  /**
   * Sets the field craete.
   * @param _craete the new value of the field craete.
   */
  public void setCraete(ch.ivyteam.ivy.cluster.CreateData _craete)
  {
    craete = _craete;
  }

  private ch.ivyteam.ivy.cluster.History history;

  /**
   * Gets the field history.
   * @return the value of the field history; may be null.
   */
  public ch.ivyteam.ivy.cluster.History getHistory()
  {
    return history;
  }

  /**
   * Sets the field history.
   * @param _history the new value of the field history.
   */
  public void setHistory(ch.ivyteam.ivy.cluster.History _history)
  {
    history = _history;
  }

  private ch.ivyteam.ivy.scripting.objects.List<ch.ivyteam.ivy.cluster.History> histories;

  /**
   * Gets the field histories.
   * @return the value of the field histories; may be null.
   */
  public ch.ivyteam.ivy.scripting.objects.List<ch.ivyteam.ivy.cluster.History> getHistories()
  {
    return histories;
  }

  /**
   * Sets the field histories.
   * @param _histories the new value of the field histories.
   */
  public void setHistories(ch.ivyteam.ivy.scripting.objects.List<ch.ivyteam.ivy.cluster.History> _histories)
  {
    histories = _histories;
  }

  private java.lang.Boolean repeated;

  /**
   * Gets the field repeated.
   * @return the value of the field repeated; may be null.
   */
  public java.lang.Boolean getRepeated()
  {
    return repeated;
  }

  /**
   * Sets the field repeated.
   * @param _repeated the new value of the field repeated.
   */
  public void setRepeated(java.lang.Boolean _repeated)
  {
    repeated = _repeated;
  }

  private java.lang.Number startedTime;

  /**
   * Gets the field startedTime.
   * @return the value of the field startedTime; may be null.
   */
  public java.lang.Number getStartedTime()
  {
    return startedTime;
  }

  /**
   * Sets the field startedTime.
   * @param _startedTime the new value of the field startedTime.
   */
  public void setStartedTime(java.lang.Number _startedTime)
  {
    startedTime = _startedTime;
  }

  private java.lang.Number duration;

  /**
   * Gets the field duration.
   * @return the value of the field duration; may be null.
   */
  public java.lang.Number getDuration()
  {
    return duration;
  }

  /**
   * Sets the field duration.
   * @param _duration the new value of the field duration.
   */
  public void setDuration(java.lang.Number _duration)
  {
    duration = _duration;
  }

  private java.lang.String cacheGroup;

  /**
   * Gets the field cacheGroup.
   * @return the value of the field cacheGroup; may be null.
   */
  public java.lang.String getCacheGroup()
  {
    return cacheGroup;
  }

  /**
   * Sets the field cacheGroup.
   * @param _cacheGroup the new value of the field cacheGroup.
   */
  public void setCacheGroup(java.lang.String _cacheGroup)
  {
    cacheGroup = _cacheGroup;
  }

  private ch.ivyteam.ivy.scripting.objects.Recordset recordset;

  /**
   * Gets the field recordset.
   * @return the value of the field recordset; may be null.
   */
  public ch.ivyteam.ivy.scripting.objects.Recordset getRecordset()
  {
    return recordset;
  }

  /**
   * Sets the field recordset.
   * @param _recordset the new value of the field recordset.
   */
  public void setRecordset(ch.ivyteam.ivy.scripting.objects.Recordset _recordset)
  {
    recordset = _recordset;
  }

}
