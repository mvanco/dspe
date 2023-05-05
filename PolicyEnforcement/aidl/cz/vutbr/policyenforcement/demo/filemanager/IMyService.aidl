package cz.vutbr.policyenforcement.demo.filemanager;
import cz.vutbr.policyenforcement.demo.filemanager.IAddResultCallback;

// Adder service interface.
interface IMyService {
int add( in int i1, in int i2, IAddResultCallback ResultCallback );
}
