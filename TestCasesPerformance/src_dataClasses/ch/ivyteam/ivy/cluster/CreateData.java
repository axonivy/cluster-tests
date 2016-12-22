package ch.ivyteam.ivy.cluster;

/**
 */
@SuppressWarnings("all")
@javax.annotation.Generated(comments="This is the java file of the ivy data class CreateData", value={"ch.ivyteam.ivy.scripting.streamInOut.IvyScriptJavaClassBuilder"})
public class CreateData extends ch.ivyteam.ivy.scripting.objects.CompositeObject
{
  /** SerialVersionUID */
  private static final long serialVersionUID = 4031619001293484912L;

  /**
   * True, if the process should repeated (after the delay)
   */
  private java.lang.Boolean repeat;

  /**
   * Gets the field repeat.
   * @return the value of the field repeat; may be null.
   */
  public java.lang.Boolean getRepeat()
  {
    return repeat;
  }

  /**
   * Sets the field repeat.
   * @param _repeat the new value of the field repeat.
   */
  public void setRepeat(java.lang.Boolean _repeat)
  {
    repeat = _repeat;
  }

  /**
   * Running seconds
   */
  private java.lang.Number runningSec;

  /**
   * Gets the field runningSec.
   * @return the value of the field runningSec; may be null.
   */
  public java.lang.Number getRunningSec()
  {
    return runningSec;
  }

  /**
   * Sets the field runningSec.
   * @param _runningSec the new value of the field runningSec.
   */
  public void setRunningSec(java.lang.Number _runningSec)
  {
    runningSec = _runningSec;
  }

  private java.lang.Number countOfTasks;

  /**
   * Gets the field countOfTasks.
   * @return the value of the field countOfTasks; may be null.
   */
  public java.lang.Number getCountOfTasks()
  {
    return countOfTasks;
  }

  /**
   * Sets the field countOfTasks.
   * @param _countOfTasks the new value of the field countOfTasks.
   */
  public void setCountOfTasks(java.lang.Number _countOfTasks)
  {
    countOfTasks = _countOfTasks;
  }

  private java.lang.Number counter;

  /**
   * Gets the field counter.
   * @return the value of the field counter; may be null.
   */
  public java.lang.Number getCounter()
  {
    return counter;
  }

  /**
   * Sets the field counter.
   * @param _counter the new value of the field counter.
   */
  public void setCounter(java.lang.Number _counter)
  {
    counter = _counter;
  }

  /**
   * The executed sql query for each task
   */
  private java.lang.String sqlQuery;

  /**
   * Gets the field sqlQuery.
   * @return the value of the field sqlQuery; may be null.
   */
  public java.lang.String getSqlQuery()
  {
    return sqlQuery;
  }

  /**
   * Sets the field sqlQuery.
   * @param _sqlQuery the new value of the field sqlQuery.
   */
  public void setSqlQuery(java.lang.String _sqlQuery)
  {
    sqlQuery = _sqlQuery;
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
