package fr.xgouchet.apkmon_demo;
import fr.xgouchet.apkmon_demo.IAddResultCallback;

// Adder service interface.
interface IMyService {
int add( in int i1, in int i2, IAddResultCallback ResultCallback );
}
