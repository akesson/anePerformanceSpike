package co.serendipi.spike.ane;

import android.util.Log;
import com.adobe.fre.*;

import java.util.HashMap;
import java.util.Map;

public class BasicANEContext extends FREContext {

    private static final int VECTOR_SIZE = 100;

    @Override
    public Map<String, FREFunction> getFunctions() {
        Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();
        functionMap.put("writeToLog", new WriteToLog());
        functionMap.put("run0Arg", new Run0Arg());
        functionMap.put("run1Arg", new Run1Arg());
        functionMap.put("run2Arg", new Run2Arg());
        functionMap.put("run3Arg", new Run3Arg());
        functionMap.put("run4Arg", new Run4Arg());
        functionMap.put("run5Arg", new Run5Arg());

        functionMap.put("returnBool", new ReturnBool());
        functionMap.put("returnUInt", new ReturnUInt());
        functionMap.put("returnInt", new ReturnInt());
        functionMap.put("returnDouble", new ReturnDouble());
        functionMap.put("returnString", new ReturnString());
        functionMap.put("returnVector", new ReturnVector());
        functionMap.put("returnObject", new ReturnObject());

        functionMap.put("createBooleans", new CreateBooleans());
        functionMap.put("createInts", new CreateInts());
        functionMap.put("createUInts", new CreateUInts());
        functionMap.put("createDoubles", new CreateDoubles());
        functionMap.put("createStrings", new CreateStrings());
        functionMap.put("createObjects", new CreateObjects());

        functionMap.put("fillInBooleans", new FillinBooleans());
        functionMap.put("fillInInts", new FillInInts());
        functionMap.put("fillInUInts", new FillInUInts());
        functionMap.put("fillInDoubles", new FillInDoubles());
        functionMap.put("fillInStrings", new FillInStrings());
        functionMap.put("fillInObjects", new FillInObjects());

        return functionMap;
    }

    @Override
    public void dispose() {

    }

    private class Run0Arg implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            return null;
        }
    }
    private class Run1Arg implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                int arg0 = freObjects[0].getAsInt();
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }
    private class Run2Arg implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                int arg0 = freObjects[0].getAsInt();
                int arg1 = freObjects[1].getAsInt();
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }
    private class Run3Arg implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                int arg0 = freObjects[0].getAsInt();
                int arg1 = freObjects[1].getAsInt();
                int arg2 = freObjects[2].getAsInt();
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }
    private class Run4Arg implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                int arg0 = freObjects[0].getAsInt();
                int arg1 = freObjects[1].getAsInt();
                int arg2 = freObjects[2].getAsInt();
                int arg3 = freObjects[3].getAsInt();
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }
    private class Run5Arg implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                int arg0 = freObjects[0].getAsInt();
                int arg1 = freObjects[1].getAsInt();
                int arg2 = freObjects[2].getAsInt();
                int arg3 = freObjects[3].getAsInt();
                int arg4 = freObjects[4].getAsInt();
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class ReturnBool implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                return FREObject.newObject(true);
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class ReturnUInt implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                return FREObject.newObject(2);
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class ReturnInt implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                return FREObject.newObject(-2);
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class ReturnDouble implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                return FREObject.newObject(-2.2);
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class ReturnString implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                return FREObject.newObject("myString");
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class ReturnVector implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                FREArray freArray = FREArray.newArray("co.serendipi.spike.ane.SimpleObject", VECTOR_SIZE, true);
                return freArray;
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class ReturnObject implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                return FREObject.newObject("co.serendipi.spike.ane.SimpleObject",
                        new FREObject[] { FREObject.newObject(2) });
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class CreateBooleans implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                FREArray freArray = FREArray.newArray("Boolean", VECTOR_SIZE, true);
                for (int i = 0; i < VECTOR_SIZE; ++i) {
                    freArray.setObjectAt(i, FREObject.newObject(false));
                }
                return freArray;
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class CreateInts implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                FREArray freArray = FREArray.newArray("int", VECTOR_SIZE, true);
                for (int i = 0; i < VECTOR_SIZE; ++i) {
                    freArray.setObjectAt(i, FREObject.newObject(3));
                }
                return freArray;
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class CreateDoubles implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                FREArray freArray = FREArray.newArray("Number", VECTOR_SIZE, true);
                for (int i = 0; i < VECTOR_SIZE; ++i) {
                    freArray.setObjectAt(i, FREObject.newObject(3.4));
                }
                return freArray;
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class CreateUInts implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                FREArray freArray = FREArray.newArray("uint", VECTOR_SIZE, true);
                for (int i = 0; i < VECTOR_SIZE; ++i) {
                    freArray.setObjectAt(i, FREObject.newObject(4));
                }
                return freArray;
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class CreateStrings implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                FREArray freArray = FREArray.newArray("String", VECTOR_SIZE, true);
                for (int i = 0; i < VECTOR_SIZE; ++i) {
                    freArray.setObjectAt(i, FREObject.newObject("mystring"));
                }
                return freArray;
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class CreateObjects implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            try {
                FREArray freArray = FREArray.newArray("co.serendipi.spike.ane.SimpleObject", VECTOR_SIZE, true);
                for (int i = 0; i < VECTOR_SIZE; ++i) {
                    freArray.setObjectAt(i, FREObject.newObject("co.serendipi.spike.ane.SimpleObject",
                            new FREObject[] { FREObject.newObject(i) }));
                }
                return freArray;
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class FillinBooleans implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            return null;
        }
    }

    private class FillInInts implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            return null;
        }
    }

    private class FillInUInts implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            return null;
        }
    }

    private class FillInDoubles implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            return null;
        }
    }

    private class FillInStrings implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            return null;
        }
    }

    private class FillInObjects implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            FREArray freArray = (FREArray) freObjects[0];
            try {
                for (int i = 0; i < VECTOR_SIZE; ++i) {
                    freArray.getObjectAt(i).setProperty("number", FREObject.newObject(i));
                }
                return freArray;
            } catch (Exception e) {
                Log.e("ANEPERF", e.getMessage(), e);
            }
            return null;
        }
    }

    private class WriteToLog implements FREFunction {
        @Override
        public FREObject call(FREContext freContext, FREObject[] freObjects) {
            String message = null;
            try {
                message = freObjects[0].getAsString();
                Log.i("ANEPERF", message);
            } catch (FRETypeMismatchException e) {
                e.printStackTrace();
            } catch (FREInvalidObjectException e) {
                e.printStackTrace();
            } catch (FREWrongThreadException e) {
                e.printStackTrace();
            }
            return null;
        }
    }
}

